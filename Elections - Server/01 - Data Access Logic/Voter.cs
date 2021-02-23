using System;
using System.Collections.Generic;

#nullable disable

namespace David
{
    public partial class Voter
    {
        public Voter()
        {
            VotersParties = new HashSet<VotersParty>();
        }

        public string VoterId { get; set; }
        public string FullName { get; set; }
        public string Gender { get; set; }
        public string CellPhone { get; set; }
        public string Email { get; set; }
        public DateTime? IdProdDate { get; set; }
        public string City { get; set; }

        public virtual ICollection<VotersParty> VotersParties { get; set; }
    }
}
