public class Student_Info_School {
	public string USN;
    public string name;
    public integer marks;
    public string address;
    public string className;
    public integer standard;
    public string teacherName;
    public string subjects;
    public Student_Info_School(){
        USN='12453';
        name='SAM';
        marks= 100;
        address='PATNA';
        className='ACHEIVER';
        standard= 10;
    }
    public list<string> TeacherName(){
        list<string> ls=new list<string>();
        ls.add('ABC');
        ls.add('MJK');
        return ls;
           }
    public string Details(){
        return USN+ ' '+name+ ' '+ marks+' '+address;
    }
    public string classDetails(){
        return name+ ' '+ className+' '+ standard;
    }
    public map<String,Integer> studentDetails(){
        map<String,Integer> mp= new  map<String,Integer>();
        mp.put('Sam',28);
        mp.put('Paul',68);
        mp.put('Abhijeet',38);
         return mp;
    }
    public set<String> studentSets(){
        set<String> stud= new set<String>{'Virat','Rohit','MSD'};
        return stud;
    }
}