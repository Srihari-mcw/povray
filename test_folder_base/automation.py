import os
import re
import csv
import glob
import argparse
import time


def parse_args():
    parser = argparse.ArgumentParser(description='Options for POV Ray testing')
    parser.add_argument ("-i", "--iteration", help = "iterations to run", type=int, default = 1, dest = "iterations")
    parser.add_argument ("-r", "--result_dir", help = "result directory", default = os.getcwd(), dest = "result_dir")
    options = parser.parse_args()

    return options

def get_scores(file):
    photon=0
    radiosity=0
    trace=0
    with open(file)as input_file:
        lines = input_file.read()
        # print(lines)
        x = re.findall("(\d+\.\d+ seconds)", lines)
        x = [i.split(' ')[0] for i in x] 
        print(f"Extracted timings (x): {x}")
        print(len(x))
        photon=x[0]
        radiosity = x[1] if len(x)>1 else 0
        trace = x[2] if len(x)>2 else 0
        if len(x)<6:
            i = 2
            if re.findall("No photons",lines):
                photon=0
                radiosity=x[i]
                trace = x[i+1] if len(x)>1 else 0
            if re.findall("No radiosity",lines):
                radiosity=0
                if photon ==0:
                    trace=x[i]
                else:
                    photon=x[i]
                    trace = x[i+1] if len(x)>1 else 0
            if re.findall("No Trace", lines):
                trace=0
                if photon ==0:
                    radiosity=x[i]
                else:
                    photon=x[i]
                    radiosity = x[i+1] if len(x)>1 else 0
        score = [float(photon), float(radiosity), float(trace)]
        print(score)
    return score

def compute_average(scores:list, iterations:int):
    photon = 0 
    radiosity = 0
    trace = 0
    for i in range(iterations):
        photon += scores[i][0]
        radiosity += scores[i][1]
        trace += scores[i][2]
    example_scores = [photon/iterations, radiosity/iterations, trace/iterations]
    return example_scores

def write_csv(example, scores:list, result_dir, iteration):
    header = ["Example", "Photon time", "Radiosity Time", "Trace Time"]
    target_file= f"{result_dir}/Overall Output_512.csv"
    example_scores = compute_average(scores, iteration)
    example_scores.insert(0,example)

    with open(target_file, "a",newline='') as csv_file:
        csv_writer = csv.writer(csv_file)
        if os.stat(target_file).st_size == 0:
            csv_writer.writerow(header)
        csv_writer.writerow(example_scores)
        

if __name__ == "__main__":
    options = parse_args()
    #examples=["mediasky"]
    examples = ["benchmark", "ess-ortho-camera", "ess-persp-camera", "balcony", "mediasky", "ballbox1", "landscape", "woodbox", "optics"]
    
    for i in range(options.iterations):
        for item in examples:
            output=f"{options.result_dir}/{item}_{i+1}.txt"
            os.system(f"povconsole64-avx512.exe +WT1 {item}.pov +W320 +H240 > {output} 2>&1")

    time.sleep(10)

    for item in examples:
        scores = []
        for file in glob.glob(f"{options.result_dir}/{item}*.txt"):
            print(file)
            scores.append(get_scores(file))
        write_csv(item, scores, options.result_dir, options.iterations)
