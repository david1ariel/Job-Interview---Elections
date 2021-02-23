using System;
using System.Collections.Generic;

#nullable disable

namespace David
{
    public partial class VotersParty
    {
        public int VotersPartyId { get; set; }
        public int PartyId { get; set; }
        public string VoterId { get; set; }

        public virtual Party Party { get; set; }
        public virtual Voter Voter { get; set; }
    }
}
