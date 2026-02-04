using System;

namespace StudentRegistrationSystem.Models
{
    public class Student
    {
        public int StudentID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string Address { get; set; }
        public string Gender { get; set; }
        public DateTime RegistrationDate { get; set; }
        public bool IsActive { get; set; }

        public string FullName
        {
            get { return FirstName + " " + LastName; }
        }
    }
}
