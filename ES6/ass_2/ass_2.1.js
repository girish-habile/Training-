class Engine{
    start(){
        console.log("Engine started")
    }
    stop(){
        console.log("Engine stoped")
    }
}

class car{
    constructor(make , model){
        this.make = make;
        this.model = model;
        this.engine = new Engine();
    }
     displayInfo(){
        console.log(`Make : ${this.make} Model: ${this.model}`);
    }

    startEngine() {
        this.engine.start(); 
      }
    
      stopEngine() {
        this.engine.stop(); 
      }

}

const BMW = new car('2017' , 'M series');

BMW.displayInfo();

class ElectricCar extends car{
    constructor(make , model , batteryCapacity){
        super(make , model);
        this.batteryCapacity = batteryCapacity;
    }
    displayInfo(){
        super.displayInfo();
        console.log(`Battery Capacity :${this.batteryCapacity}`);
    }

}

const BMW2 = new ElectricCar('2017' , 'M series' , 45);
BMW2.displayInfo();




const mycar = new car('2019' ,'audi' );
mycar.displayInfo();
mycar.startEngine();
mycar.stopEngine();

  





