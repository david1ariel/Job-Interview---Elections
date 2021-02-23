using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace David
{
    public class ElectionsLogic : IDisposable
    {
        Elections2Context DB;

        public ElectionsLogic(Elections2Context db)
        {
            DB = db;
        }

        public List<VoterModel> GetAllVoters()
        {
            return DB.Voters.Select(p => new VoterModel(p)).ToList();
        }

        public List<PartyModel> GetAllParties()
        {
            return DB.Parties.Select(p => new PartyModel(p)).ToList();
        }

        public List<VotersPartyModel> GetAllVotersParties()
        {
            return DB.VotersParties.Select(p => new VotersPartyModel(p)).ToList();
        }

        public VotersPartyModel AddVote(VotersPartyModel votersPartyModel)
        {
            VotersParty addedVotersParty = votersPartyModel.ConvertToVotersParty();
            DB.VotersParties.Add(addedVotersParty);
            DB.SaveChanges();
            votersPartyModel.VotersPartyId = addedVotersParty.VotersPartyId;
            return votersPartyModel;
        }

        public VoterModel GetVoterByCredentials(CredentialsModel credentialsModel)
        {
            Voter voter = DB.Voters.SingleOrDefault(p => p.VoterId == credentialsModel.VoterId && p.IdProdDate == credentialsModel.IdProdDate);
            if (voter == null)
            {
                return null;
            }
            else
            {
                return new VoterModel(voter);
            }
        }

        public List<ReportModel> GetAllReportModels()
        {
            List<VoterModel> voters = GetAllVoters();
            List<VotersPartyModel> votersParties = GetAllVotersParties();
            List<PartyModel> parties = GetAllParties();
            List<ReportModel> reportModels = new List<ReportModel>();
            foreach (var item in votersParties)
            {
                string partyToCheck = parties.SingleOrDefault(p => p.PartyId == votersParties.FirstOrDefault(p => p.VoterId == item.VoterId).PartyId).Name;
                if (partyToCheck != "")
                {
                    string city = voters.SingleOrDefault(p => p.VoterId == item.VoterId).City;
                    reportModels.Add(new ReportModel
                    {
                        City = city,
                        VoterId = item.VoterId,
                        Party = partyToCheck
                    }
                );
                }
            }
            return reportModels;
        }


        public void Dispose()
        {
            DB.Dispose();
        }
    }
}
