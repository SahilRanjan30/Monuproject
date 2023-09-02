public with sharing class Student {
    public String name;
    public Integer rollNo;
    public String id;
    public Integer age;
    public Date dob;
    public Date admissionDate;
    public Integer studyGrade;
    public String gender; //enumType 
    public Student(String name, Integer rollNo,  Date dob, Integer studyGrade ) {
        this.name = name;
        this.rollNo = rollNo;
        this.dob = dob;
        this.age = dob.monthsBetween((date.today()))/12;
        this.studyGrade = studyGrade;
    }
    public Integer getAverageAge(List<Student> stdList){
        Integer sum=0;
        Integer count = 0;
        for(Student std: stdList){
            count += 1;
            sum += std.age;
        }
        System.debug(age);
        System.debug(name);
        return sum/count;
    }
}