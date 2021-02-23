using System;
using System.Collections.Generic;

#nullable disable

namespace David
{
    public class VotersPartyModel
    {
        public int VotersPartyId { get; set; }
        public int PartyId { get; set; }
        public string VoterId { get; set; }

        public VotersPartyModel() { }

        public VotersPartyModel(VotersParty votersParty)
        {
            VotersPartyId = votersParty.VotersPartyId;
            PartyId = votersParty.PartyId;
            VoterId = votersParty.VoterId;
        }

        public VotersParty ConvertToVotersParty()
        {
            return new VotersParty
            {
                VotersPartyId = VotersPartyId,
                PartyId = PartyId,
                VoterId = VoterId,
            };
        }
    }
}
