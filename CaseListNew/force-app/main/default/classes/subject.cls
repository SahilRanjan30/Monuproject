public with sharing class subject {
    public String Code;
    public String hod;
    public Boolean labsRequired;
    public String Type;// valid values
    public String Name;
    public subject(String Name,String Type,Boolean labsRequired,String hod) {
        this.Name = Name;
        this.code = Name.replaceAll('\\s+',' ').substring(0,3);// First four letter of the name
        this.labsRequired = labsRequired;
        this.hod = hod;
        this.Type=Type; //enum-type.
    }
}