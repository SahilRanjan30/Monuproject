public class TeacherInformation {
	public string Teachername;
    public integer TeacherExperience;
    public integer age;
    public string subject;
    public integer salary;
    
    public TeacherInformation()
    {
        Teachername='Sam';
        TeacherExperience=12;
        age=34;
        subject='Maths';
        salary=100000;
    }
    public string showinfo()
    {
        return Teachername + ' '+salary;
    }
}