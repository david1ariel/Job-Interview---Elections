using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;

#nullable disable

namespace David
{
    public class PartyModel
    {

        public int PartyId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ImageFileName { get; set; }
        public IFormFile Image { get; set; }

        public PartyModel() { }

        public PartyModel(Party party)
        {
            PartyId = party.PartyId;
            Name = party.Name;
            Description = party.Description;
            ImageFileName = party.ImageFileName;
        }

        public Party onvertToParty()
        {
            return new Party
            {
                PartyId = PartyId,
                Name = Name,
                Description = Description,
                ImageFileName = ImageFileName
            };
        }
    }
}
