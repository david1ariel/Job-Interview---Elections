using System;
using System.Collections.Generic;

#nullable disable

namespace David
{
    public class VoterModel
    {

        public string VoterId { get; set; }
        public string FullName { get; set; }
        public string Gender { get; set; }
        public string CellPhone { get; set; }
        public string Email { get; set; }
        public DateTime? IdProdDate { get; set; }
        public string City { get; set; }
        public string JwtToken { get; set; }

        public VoterModel() { }

        public VoterModel(Voter voter)
        {
            VoterId = voter.VoterId;
            FullName = voter.FullName;
            Gender = voter.Gender;
            CellPhone = voter.CellPhone;
            Email = voter.Email;
            IdProdDate = voter.IdProdDate;
            City = voter.City;
        }

        public Voter ConvertToVoter()
        {
            return new Voter
            {
                VoterId = VoterId,
                FullName = FullName,
                Gender = Gender,
                CellPhone = CellPhone,
                Email = Email,
                IdProdDate = IdProdDate,
                City = City,
            };
        }
    }
}
