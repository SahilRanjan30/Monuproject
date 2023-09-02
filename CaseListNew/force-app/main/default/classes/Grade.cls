public with sharing class Grade {
    public Integer standard;
    public Integer noOfStudents;
    public String classTeacher;
    public Integer noOfSections;
    public Grade(Integer standard, String classTeacher) {
        this.standard = standard;
        this.classTeacher = classTeacher;
        this.noOfSections = 1;
        this.noOfStudents = 0;
    }
    public Grade(Integer standard){
        this.standard = standard;
        this.noOfStudents = 0;
    }
    public void setClassTeacher(String teacherId, List<Teacher> tList){
        for(Teacher t: tList){
            if(t.id == teacherId){
                this.classTeacher = teacherId;
                break;
            }
        }
    }
}