from itertools import permutations
from collections import defaultdict

cities = defaultdict(dict)
with open("2015-Day-9.1_Input_Bsp.txt","rb") as f:
    for line in f:
        line = line.strip().split()
        city1, _, city2, _, distance = line
        cities[city1][city2] = int(distance)
        cities[city2][city1] = int(distance)

def total_distance(city_list):
    return sum(cities[city1][city2] for city1,city2 in zip(city_list, city_list[1:]))

distances = [total_distance(x) for x in permutations(cities.keys())]
print min(distances)
print max(distances)