using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace David.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly ElectionsLogic Logic;
        private readonly JwtHelper JwtHelper;

        public AuthController(ElectionsLogic logic, JwtHelper jwtHelper)
        {
            Logic = logic;
            JwtHelper = jwtHelper;
        }



        [HttpPost]
        [Route("login")]
        public IActionResult Login(CredentialsModel credentials)
        {
            VoterModel voter = Logic.GetVoterByCredentials(credentials);

            if (voter == null)
                return Unauthorized("Incorrect ID or ID production date");

            voter.JwtToken = JwtHelper.GetWjtToken(voter.VoterId, voter.IdProdDate.ToString());

            return Ok(voter);
        }
    }
}
