    #!/usr/bin/env python3
import os
import sys
import psutil
import pathlib
import subprocess
import numpy as np
import scipy.stats as stats
from popper.split import runner, prog_to_code
from popper.utils import Settings
from pyswip import Prolog
from multiprocessing.pool import Pool, ThreadPool
from multiprocessing import Process
import multiprocessing
import gen_data
import time
import pathlib
import logging
import random
import math
from datetime import datetime

NUM_TRAIN_EXAMPLES = 10
NUM_TEST_EXAMPLES = 1000

NUM_CPUS = 1
TIMEOUT = 300
TRIALS = list(range(1,21))
TASKS = []
TASKS += ['trains1']
TASKS += ['trains2']
TASKS += ['trains3']
TASKS += ['trains4']
TASKS += ['iggp-minimal-decay']
TASKS += ['iggp-buttons']
TASKS += ['iggp-rps']
TASKS += ['iggp-coins']
TASKS += ['dropk']
TASKS += ['droplast']
TASKS += ['evens']
TASKS += ['finddup']
TASKS += ['last']
TASKS += ['len']
TASKS += ['sorted']
TASKS += ['sumlist']

path = pathlib.Path().resolve()

def partmap(func, jobs, num_cups = NUM_CPUS):
    if num_cups == 1:
        return list(map(func, jobs))
    with ThreadPool(num_cups) as p:
        return list(p.map(func, jobs))

def get_time():
    now = datetime.now()
    current_time = now.strftime("%H:%M:%S")
    return current_time


def parpmap(func, jobs, num_cups = NUM_CPUS):

    # p = ctx.Process(target=run_experiment, args=(problem, config, experiment, sema, results), name=f'{problem}::{config}')
    # p.start()

    # if num_cups == 1:
    # return list(map(func, jobs))
    with Pool(num_cups, maxtasksperchild=1) as p:
        return list(p.map(func, jobs))

# # old and horrible code
def call_(cmd, action=None, timeout=None):
    cmd = cmd.split(' ')
    p = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    if action != None:
        p.stdin.write(action.encode('utf-8'))
    try:
        output, _err = p.communicate(timeout = timeout)
        return output.decode()
    except subprocess.TimeoutExpired:
        pass
    finally:
        try:
            parent = psutil.Process(p.pid)
            for child in parent.children(recursive=True):
                child.kill()
        except psutil.NoSuchProcess:
            pass
        p.kill()

def call_prolog(files, action, timeout):
    files = ','.join((f"'{x}'" for x in files))
    cmd = f"load_files([{files}],[silent(true)]). {action}."
    # print(cmd)
    return call_('swipl -q', cmd, timeout)

def train_metagol(settings):
    task = settings.task
    trial = settings.trial
    metarules = 'metarules'
    if 'iggp' in task:
        ex_file = f'data/{task}/data/train/exs.pl'
        prim_file = f'data/{task}/metagol.pl'
        bk_file = f'data/{task}/data/train/bk.pl'
    elif 'train' in task:
        ex_file = f'data/{task}/data/train/{trial}.pl'
        prim_file = f'data/prims-trains.pl'
        bk_file = f'data/bk-trains.pl'
    else:
        ex_file = f'data/{task}/data/train/{trial}.pl'
        prim_file = f'data/prims-lists.pl'
        bk_file = f'data/bk-lists.pl'
        metarules = 'metarules-rec'

    load_files = ['metagol', prim_file, metarules, ex_file, bk_file]
    t1 = time.time()
    prog = call_prolog(load_files, 'run', TIMEOUT)
    t2 = time.time()
    if prog != None:
        prog = [x for x in prog.split('\n') if ':-' in x]
    save_prog(settings, prog, t2-t1)

def train_aleph(settings):
    task = settings.task
    trial = settings.trial
    if 'iggp' in task:
        train_file = f'{path}/data/{task}/aleph.pl'
    else:
        train_file = f'{path}/data/{task}/data/aleph/{trial}.pl'
    cmd = "induce(P),writeln('<PROG>'),numbervars(P,0,_),foreach(member(C,P),(write(C),write('. '))),writeln('</PROG>'),halt"
    load_files = [train_file]
    t1 = time.time()
    try:
        prog = call_prolog(load_files, cmd, TIMEOUT)
    except:
        prog = None
    t2 = time.time()
    if prog != None:
        xs = prog.split('<PROG>')
        if len(xs) > 1:
            prog = xs[1].split('</PROG>')[0]
            # print('PROG1',prog)
            prog = prog.replace('\n', ' ')
            prog = [x.strip() for x in prog.split('.') if len(x.strip()) > 0]
            # print('PROG2',prog)
        else:
            prog = None
    save_prog(settings, prog, t2-t1)

def gen_aleph_input(pos, neg, bk_file, bias_file, out_file):
    with open(out_file, 'w') as f:
        # read general aleph settings
        with open(bias_file) as tmp:
            f.write(tmp.read() + '\n')
        f.write(':-begin_bg.\n')
        with open(bk_file) as tmp:
            f.write(tmp.read() + '\n')
        f.write(':-end_bg.\n')
        f.write(':-begin_in_pos.\n')
        for x in pos:
            x = x[4:].replace('))',')')
            f.write(x + '\n')
        f.write(':-end_in_pos.\n')
        f.write(':-begin_in_neg.\n')
        for x in neg:
            x = x[4:].replace('))',')')
            f.write(x + '\n')
        f.write(':-end_in_neg.\n')

def gen_list_data():
    probs = []
    probs += [('dropk', gen_data.DropK)]
    probs += [('droplast', gen_data.DropLast)]
    probs += [('evens', gen_data.Evens)]
    probs += [('finddup', gen_data.FindDupl)]
    probs += [('last', gen_data.Last)]
    probs += [('len', gen_data.Len)]
    probs += [('member', gen_data.Member)]
    probs += [('sorted', gen_data.Sorted)]
    probs += [('sumlist', gen_data.SumList)]

    for (task, _) in probs:
        with open(f'data/{task}/all-bias.pl', 'w') as f:
            with open(f'data/bias-list.pl') as tmp:
                for line in tmp:
                    f.write(line)
            f.write('\n')
            with open(f'data/{task}/bias.pl') as tmp:
                for line in tmp:
                    f.write(line)

    for (task, x) in probs:
        pathlib.Path(f'{path}/data/{task}/data/train/').mkdir(parents=True, exist_ok=True)
        pathlib.Path(f'{path}/data/{task}/data/test/').mkdir(parents=True, exist_ok=True)
        pathlib.Path(f'{path}/data/{task}/data/programs').mkdir(parents=True, exist_ok=True)
        pathlib.Path(f'{path}/data/{task}/data/results').mkdir(parents=True, exist_ok=True)
        for trial in TRIALS:
            print(get_time(),f'GEN DATA: task:{task}\t trial:{trial}')
            # TRAIN DATA
            train_ex_file = f'{path}/data/{task}/data/train/{trial}.pl'
            train_pos = [x.gen_pos() for i in range(NUM_TRAIN_EXAMPLES)]
            train_neg = [x.gen_neg() for i in range(NUM_TRAIN_EXAMPLES)]
            with open(train_ex_file, 'w') as f:
                for ex in train_pos:
                    f.write(f'pos({ex}).\n')
                for ex in train_neg:
                    f.write(f'neg({ex}).\n')

            # TEST DATA
            train_ex_file = f'{path}/data/{task}/data/test/{trial}.pl'
            test_pos = [x.gen_pos() for i in range(NUM_TEST_EXAMPLES)]
            test_neg = [x.gen_neg() for i in range(NUM_TEST_EXAMPLES)]
            with open(train_ex_file, 'w') as f:
                for ex in test_pos:
                    f.write(f'pos({ex}).\n')
                for ex in test_neg:
                    f.write(f'neg({ex}).\n')

            # WRITE ALEPH INPUT
            pathlib.Path(f'{path}/data/{task}/data/aleph/').mkdir(parents=True, exist_ok=True)
            train_ex_file = f'{path}/data/{task}/data/aleph/{trial}.pl'
            with open(train_ex_file, 'w') as f:
                # read general aleph settings
                with open('aleph-lists.pl') as tmp:
                    f.write(tmp.read() + '\n')
                # read task-specific aleph settings
                with open(f'{path}/data/{task}/aleph.pl') as tmp:
                    f.write(tmp.read() + '\n')
                f.write(':-begin_bg.\n')
                with open('data/bk-lists.pl') as tmp:
                    f.write(tmp.read() + '\n')
                f.write(':-end_bg.\n')
                f.write(':-begin_in_pos.\n')
                for ex in train_pos:
                    f.write(ex + '.\n')
                f.write(':-end_in_pos.\n')
                f.write(':-begin_in_neg.\n')
                for ex in train_neg:
                    f.write(ex + '.\n')
                f.write(':-end_in_neg.\n')




def partition(xs, rate=80):
    k = int((len(xs) / 100)*rate)
    return xs[:k], xs[k:]

def gen_train_data():
    probs = []
    probs += ['trains1']
    probs += ['trains2']
    probs += ['trains3']
    probs += ['trains4']
    for task in probs:
        pos = []
        neg = []
        with open(f'data/{task}/exs.pl') as f:
            for line in f:
                line = line.strip()
                if line.startswith('pos'):
                    pos.append(line)
                elif line.startswith('neg'):
                    neg.append(line)

        for trial in TRIALS:
            random.shuffle(pos)
            random.shuffle(neg)

            train_pos, test_pos = partition(pos)
            train_neg, test_neg = partition(neg)

            path = f'data/{task}/data/train/'
            pathlib.Path(path).mkdir(parents=True, exist_ok=True)
            with open(f'{path}/{trial}.pl', 'w') as f:
                for x in train_pos + train_neg:
                    f.write(x + '\n')
            path = f'data/{task}/data/test/'
            pathlib.Path(path).mkdir(parents=True, exist_ok=True)
            with open(f'{path}/{trial}.pl', 'w') as f:
                for x in test_pos + test_neg:
                    f.write(x + '\n')

            path = f'data/{task}/data/aleph/'
            pathlib.Path(path).mkdir(parents=True, exist_ok=True)
            # ALEPH
            gen_aleph_input(pos, neg, 'data/bk-trains.pl', f'data/aleph-trains.pl', f'{path}/{trial}.pl',)



def get_prog_file(settings):
    path = f'data/{settings.task}/programs'
    pathlib.Path(path).mkdir(parents=True, exist_ok=True)
    fname = f'{path}/{settings.name}-{settings.trial}.csv'
    return fname

def save_prog(settings, prog, duration):
    fname = get_prog_file(settings)
    with open(fname, 'w') as f:
        if prog != None:
            for rule in prog:
                if rule[-1] != '.':
                    rule += '.'
                f.write(rule + '\n')
        f.write(f'%time,{duration}\n')

def save_res(settings, tp, fn, tn, fp):
    path = f'data/{settings.task}/results/'
    pathlib.Path(path).mkdir(parents=True, exist_ok=True)
    fname = f'{path}/{settings.name}-{settings.trial}.csv'
    with open(fname, 'w') as f:
        f.write(f'{tp}, {fn}, {tn}, {fp}')

# def test_(settings):
#     prolog = Prolog()
#     prolog.consult(settings.ex_file)
#     prolog.consult(settings.bk_file)
#     prolog.consult('test.pl')
#     prolog.consult(f'data/{settings.task}/programs/{settings.name}-{settings.trial}.csv')
#     res = list(prolog.query('do_test(TP,FN,TN,FP)'))[0]
#     print(settings.name, settings.trial, res)
#     save_res(settings, res['TP'], res['FN'], res['TN'], res['FP'])

def test_(settings):
    from multiprocessing import Process
    p = Process(target=test__, args=(settings,))
    p.start()
    p.join()

def test__(settings):
    prolog = Prolog()
    prolog.consult(settings.ex_file)
    prolog.consult(settings.bk_file)
    prolog.consult('test.pl')
    prolog.consult(f'data/{settings.task}/programs/{settings.name}-{settings.trial}.csv')
    res = list(prolog.query('do_test(TP,FN,TN,FP)'))[0]
    save_res(settings, res['TP'], res['FN'], res['TN'], res['FP'])


# def test_(settings):
#     # prolog = Prolog()
#     load_files = [settings.ex_file, settings.bk_file, 'test.pl', f'data/{settings.task}/programs/{settings.name}-{settings.trial}.csv']
#     cmd = 'do_test(TP,FN,TN,FP),halt.'
#     print(settings.name, settings.trial, res)
#     # save_res(settings, res['TP'], res['FN'], res['TN'], res['FP'])


def train_(settings):
    t1 = time.time()
    prog = runner(settings)
    t2 = time.time()
    if prog != None:
        prog = prog_to_code(prog)
    save_prog(settings, prog, t2-t1)

def train_lists(settings):
    settings.ex_file = f'{path}/data/{settings.task}/data/train/{settings.trial}.pl'
    settings.bias_file = f'{path}/data/{settings.task}/all-bias.pl'
    settings.bk_file = f'{path}/data/bk-lists.pl'
    train_(settings)

def train_iggp(settings):
    settings.ex_file = f'{path}/data/{settings.task}/data/train/exs.pl'
    settings.bias_file = f'{path}/data/{settings.task}/bias.pl'
    settings.bk_file = f'{path}/data/{settings.task}/data/train/bk.pl'
    train_(settings)

def train_trains(settings):
    settings.ex_file = f'{path}/data/{settings.task}/data/train/{settings.trial}.pl'
    settings.bias_file = f'{path}/data/bias-trains.pl'
    settings.bk_file = f'{path}/data/bk-trains.pl'
    train_(settings)

def test_lists(settings):
    settings.ex_file = f'{path}/data/{settings.task}/data/test/{settings.trial}.pl'
    settings.bias_file = f'{path}/data/{settings.task}/all-bias.pl'
    settings.bk_file = f'{path}/data/bk-lists.pl'

def test_iggp(settings):
    settings.ex_file = f'{path}/data/{settings.task}/data/test/exs.pl'
    settings.bias_file = f'{path}/data/{settings.task}/bias.pl'
    settings.bk_file = f'{path}/data/{settings.task}/data/test/bk.pl'

def test_trains(settings):
    settings.ex_file = f'{path}/data/{settings.task}/data/test/{settings.trial}.pl'
    settings.bias_file = f'{path}/data/{settings.task}/bias.pl'
    settings.bk_file = f'{path}/data/bk-trains.pl'

def get_metagol_settings(task, trial):
    settings = Settings(cmd_line=False)
    settings.task = task
    settings.trial = trial
    settings.name = 'metagol'
    return settings

def get_aleph_settings(task, trial):
    settings = Settings(cmd_line=False)
    settings.task = task
    settings.trial = trial
    settings.name = 'aleph'
    return settings

def get_settings(trial, task, baseline=False, constraints=True, chunking=True, lazy=True, optimistic=False):
    settings = Settings(cmd_line=False)
    settings.eval_timeout = 0.001
    settings.timeout = TIMEOUT
    settings.trial = trial
    settings.task = task
    settings.baseline = baseline
    settings.constraints = constraints
    settings.chunking = chunking
    settings.lazy = lazy
    settings.optimistic = optimistic
    if baseline:
        settings.name = f'popper'
    elif optimistic:
        settings.name = f'optimistic'
    elif constraints == False:
        settings.name = f'dumb'
    elif chunking == False:
        settings.name = 'no-chunking'
    elif lazy == False:
        settings.name = 'no-eagerness'
    else:
        settings.name = f'dcc'
    return settings

def train_popper(settings):
    if 'iggp' in settings.task:
        train_iggp(settings)
    elif 'train' in settings.task:
        train_trains(settings)
    else:
        train_lists(settings)

def test_popper(settings):
    print(get_time(),f'TEST: task:{settings.task}\t task:{settings.name}\t trial:{settings.trial}')
    if 'iggp' in settings.task:
        test_iggp(settings)
    elif 'train' in settings.task:
        test_trains(settings)
    else:
        test_lists(settings)
    test_(settings)

def myround(x):
    if x < 1:
        x = round(x,1)
        if x == 0:
            return 0
        return x
    return int(x)

def get_predictions(settings, stuff):
        prolog = Prolog()
        prolog.consult(settings.ex_file)
        prolog.consult(settings.bk_file)
        prolog.consult('test.pl')
        prolog.consult(f'data/{settings.task}/programs/{settings.name}-{settings.trial}.csv')
        res = list(prolog.query('get_predictions(S0,S1)'))[0]
        stuff['stuff'] = res['S0']+res['S1']

def get_acc_array(task, settings, trial):
    with multiprocessing.Manager() as manager:
        l = manager.dict()
        l['stuff'] = None
        p = Process(target=get_predictions, args=(settings, l))
        p.start()
        p.join()
        # print(l['stuff'])
        return l['stuff']

def get_accs(task, settings):
    path = f'data/{task}/results/'
    accs = []
    for trial in TRIALS:
        fname = f'{path}/{settings.name}-{trial}.csv'
        with open(fname) as f:
            for line in f:
                xs = line.split(',')
                if len(xs) > 1:
                    # print(task, settings.name, line)
                    tp, fn, tn, fp = int(xs[0]), int(xs[1]), int(xs[2]), int(xs[3])
                    # print(tp,fn,tn,fp)
                    # accs.append(tp / (tp+fn))
                    accs.append((tp + tn) / (tp+fn+tn+fp))
    return int(np.mean(accs)*100), int(stats.sem(accs)*100)

def get_time_(task, settings, trial):
    settings.task = task
    settings.trial = trial
    fname = get_prog_file(settings)
    with open(fname) as f:
        for line in f:
            if line.startswith('%time'):
                return float(line.split(',')[1])

def get_times(task, settings):
    settings.task = task
    times = []
    for trial in TRIALS:
        settings.trial = trial
        fname = get_prog_file(settings)
        with open(fname) as f:
            for line in f:
                if line.startswith('%time'):
                    times.append(float(line.split(',')[1]))
    return myround(np.mean(times)), myround(stats.sem(times))

def print_rows(systems, func):
    for task in TASKS:
        x = '\\tw{' + task + '}'
        for system in systems:
            value,err = func(task, system)
            x += f' & {value} $\pm$ {err}'
        x+= ' \\\\'
        print(x)

# def tests():
#     # dcc
#     x = get_settings(1, 1)
#     # popper
#     # y = get_settings(1, 1, baseline=True)
#     # no constraints
#     # y = get_settings(1, 1, constraints=False)
#     # lazy
#     # y = get_settings(1, 1, lazy=False)
#     # compression
#     y = get_settings(1, 1, chunking=False)
#     accs = {system:[] for system in [x, y]}
#     times = {system:[] for system in [x, y]}
#     for system in [x, y]:
#         for task in TASKS:
#             for trial in TRIALS:
#                 acc = get_acc_(task, system, trial)
#                 time = get_time_(task, system, trial)
#                 accs[system].append(acc)
#                 times[system].append(time)
#     # xs = accs[x]
#     # ys = accs[y]

#     # McN = math.pow((b-c),2) / (b+c)
#     # print(f'accuracies p-value: {1-stats.chi2.cdf(McN,1):.3f}')

#     xs = times[x]
#     ys = times[y]
#     print(xs)
#     print(ys)
#     res = stats.ttest_rel(xs, ys)
#     print(f'times p-value: {res.pvalue:.5f}')

def tests():
    # dcc
    x = get_settings(1, 1)
    # popper
    y = get_settings(1, 1, baseline=True)
    # no constraints
    # y = get_settings(1, 1, constraints=False)
    # lazy
    # y = get_settings(1, 1, lazy=False)
    # compression
    # y = get_settings(1, 1, chunking=False)


    # TRIALS = [2]
    # T
    # ACCS
    predictions = {system:[] for system in [x, y]}
    for settings in [x, y]:
        for task in TASKS:
            settings.task = task
            for trial in TRIALS:
                settings.trial = trial
                if 'iggp' in task:
                    test_iggp(settings)
                elif 'train' in task:
                    test_trains(settings)
                else:
                    test_lists(settings)
                predictions[settings].extend(get_acc_array(task, settings, trial))
    xs = predictions[x]
    ys = predictions[y]
    print('xs',xs)
    print('ys',ys)
    b = sum(1.0 for (x, y) in zip(xs, ys) if x == 1 and y == 0)
    c = sum(1.0 for (x, y) in zip(xs, ys) if x == 0 and y == 1)
    print(b, c)
    McN = math.pow((b-c),2) / (b+c)
    print(f'accuracies p-value: {1-stats.chi2.cdf(McN,1):.3f}')


    # times = {system:[] for system in [x, y]}
    # TIMES
    # for system in [x, y]:
    #     for task in TASKS:
    #         for trial in TRIALS:
    #             time = get_time_(task, system, trial)
    #             times[system].append(time)

    # xs = times[x]
    # ys = times[y]
    # print(xs)
    # print(ys)
    # res = stats.ttest_rel(xs, ys)
    # print(f'times p-value: {res.pvalue:.5f}')

def print_results1():
    systems = []
    # dcc
    systems.append(get_settings(1, 1))
    # popper
    systems.append(get_settings(1, 1, baseline=True))
    # aleph
    systems.append(get_aleph_settings(1, 1))
    # metagol
    systems.append(get_metagol_settings(1, 1))
    print_rows(systems, get_accs)
    print('TIMES'*10)
    print_rows(systems, get_times)

def print_results2():
    systems = []
    # dcc
    systems.append(get_settings(1, 1))
    # optimistic dcc
    systems.append(get_settings(1, 1, optimistic=True))
    # dcc without constraints
    systems.append(get_settings(1, 1, constraints=False))
    # dcc without lazy coverage
    systems.append(get_settings(1, 1, lazy=False))
    # dcc without chunking
    systems.append(get_settings(1, 1, chunking=False))

    print_rows(systems, get_accs)
    print('TIMES'*10)
    print_rows(systems, get_times)

def train_aux(job):
    print(get_time(), f'TRAIN {job.name}: task:{job.task}\t trial:{job.trial}')
    if job.name == 'metagol':
        train_metagol(job)
    elif job.name == 'aleph':
        train_aleph(job)
    else:
        train_popper(job)

def do_it(mode):
    jobs = []

    for trial in TRIALS:
        for task in TASKS:
            # aleph
            jobs.append(get_aleph_settings(task, trial))
            # metagol
            jobs.append(get_metagol_settings(task, trial))
            # popper
            jobs.append(get_settings(trial, task, baseline=True))
            # dcc
            jobs.append(get_settings(trial, task))
            # optimistic dcc
            jobs.append(get_settings(trial, task, optimistic=True))
            # dcc without constraints
            jobs.append(get_settings(trial, task, constraints=False))
            # dcc without chunking
            jobs.append(get_settings(trial, task, chunking=False))
            # dcc without lazy coverage
            jobs.append(get_settings(trial, task, lazy=False))
    if mode == 'train':
        partmap(train_aux, jobs)
    elif mode == 'test':
        print('testing')
        partmap(test_popper, jobs)
    elif mode == 'results':
        print_results1()
        print('----------')
        print_results2()
            
if __name__ == '__main__':
    # pass
    x = sys.argv[1]
    if x == 'gen':
        gen_train_data()
        gen_list_data()

    do_it(x)