using System;
using System.Collections.Generic;

#nullable disable

namespace David
{
    public partial class Party
    {
        public Party()
        {
            VotersParties = new HashSet<VotersParty>();
        }

        public int PartyId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ImageFileName { get; set; }

        public virtual ICollection<VotersParty> VotersParties { get; set; }
    }
}
