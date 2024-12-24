# 定义一个汽车类，包含汽车品牌、种类、年份、汽车的速度、加速度、车灯状态等属性，同时、包含加速方法、开灯、关灯方法
# 调用通过加速方法(加速度和加速时间)来改变汽车的运行速度、通过调用开关灯方法来改变车灯状态

class car:
    def __init__(self,brand,category,year,speed,acceleration,light):
        self.brand = brand             
        self.category = category       
        self.year = year               
        self.speed = speed             
        self.acceleration = acceleration
        self.light = light

    def speed_up(self,acceleration,time):
        self.speed += acceleration * time
        print('The speed of the car is',self.speed)

    def turn_on_light(self):
        self.light = 'on'
        print('The light of the car is',self.light)

    def turn_off_light(self):
        self.light = 'off'
        print('The light of the car is',self.light)

if __name__ == '__main__':
    car1 = car('BMW','SUV',2020,0,0,'off')
    car1.speed_up(10,1)
    car1.turn_on_light()
    car1.turn_off_light()