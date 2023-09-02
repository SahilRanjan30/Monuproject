public with sharing class teacher {
    public string name;
    public integer classTeacher;
    public string level; // enum-type
    public string designation; //enum-type
    public string id;
    public teacher(String name,String designation,String id,string level) {
        this.name=name;
        this.designation=designation;
        this.id=id;
        this.level=level;
    }
}