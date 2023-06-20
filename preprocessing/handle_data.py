import json

net_file = './data/net.json'
vehicle_file = './data/vehicle.json'


class lane:
    def __init__(self, _id, _index, _type, _speed, _length, _shape):
        self.id = _id
        self.index = _index
        self.type = _type
        self.speed = _speed
        self.length = _length
        self.shape = _shape

    def display(self):
        print(f"ID: {self.id}, Index: {self.index}, Type: {self.type}, Speed: {self.speed}, Length: {self.length}, Shape: {self.shape}")

lanes = []

with open(net_file) as json_file:
    data = json.load(json_file)
    
    edge = data['net']['edge']
    junction = data['net']['junction']
    connection = data['net']['connection']

    for i in edge:
        try:
            type_of_lane = i['type']
            if(type(i['lane']) == list):
                for j in i['lane']:
                    lanes.append(lane(j['id'], j['index'], type_of_lane, j['speed'], j['length'], j['shape']))
            elif(type(i['lane']) == dict):
                lanes.append(lane(i['id'], i['index'], type_of_lane, i['speed'], i['length'], i['shape']))

        except KeyError:
            print("Not have key type")
        
    # for l in lanes:
    #     l.display()

class vehicle:
    def __init__(self, _time, _node, _x, _y, _angle, _speed, _pos, _lane, _slope):
        self.time = _time
        self.node = _node
        self.x = _x
        self.y = _y
        self.angle = _angle
        self.speed = _speed
        self.pos = _pos
        self.lane = _lane
        self.slope = _slope

    def display(self):
        print(f"Time: {self.time}, Node: {self.node}, X: {self.x}, Y: {self.y}, Angle: {self.angle}, Speed: {self.speed}, Position: {self.pos}, Lane: {self.lane}, Slope: {self.slope}")

vehicles = []

with open(vehicle_file) as json_file:
    data = json.load(json_file)

    timestep = data['fcd-export']['timestep']

    for i in timestep:
        if (type(i['vehicle']) == list):
            for j in i['vehicle']:
                vehicles.append(vehicle(i['time'], j['id'], j['x'], j['y'], 
                       j['angle'], j['speed'], j['pos'], 
                       j['lane'], j['slope']))
        elif (type(i['vehicle']) == dict):
            vehicles.append(vehicle(i['time'], i['vehicle']['id'], i['vehicle']['x'], i['vehicle']['y'], 
                       i['vehicle']['angle'], i['vehicle']['speed'], i['vehicle']['pos'], 
                       i['vehicle']['lane'], i['vehicle']['slope']))

    # for v in vehicles:
    #     for i in vehicles:
    #         if ( v.id == i.id and v.pos == i.pos and v.id == '1')
        

class export: 
    def __init__(self, _timestamp, _location, _veloccity, _duration, _road_type, _road_condition, _road_event):
        self.timestamp = _timestamp
        self.location = _location
        self.velocity = _veloccity
        self.duration = _duration
        self.road_type = _road_type
        self.road_condition = _road_condition
        self.road_event = _road_event

    def display(self):
        print(f"Timestamp: {self.timestamp}, location: {self.location}, velocity: {self.velocity}, duration: {self.duration}, road type: {self.road_type}, road condition: {self.road_condition}. road event: {self.road_event}")

exports = []

