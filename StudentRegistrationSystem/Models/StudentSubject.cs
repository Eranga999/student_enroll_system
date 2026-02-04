using System;

namespace StudentRegistrationSystem.Models
{
    public class StudentSubject
    {
        public int EnrollmentID { get; set; }
        public int StudentID { get; set; }
        public int SubjectID { get; set; }
        public DateTime EnrollmentDate { get; set; }
        public string Status { get; set; }
        public string Grade { get; set; }

        // Navigation properties
        public string SubjectCode { get; set; }
        public string SubjectName { get; set; }
        public int Credits { get; set; }
    }
}
