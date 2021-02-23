using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace David.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ElectionsController : ControllerBase
    {
        private readonly ElectionsLogic Logic;

        public ElectionsController(ElectionsLogic logic)
        {
            this.Logic = logic;
        }

        [HttpGet]
        [Route("voters")]
        public IActionResult GetAllVoters()
        {
            try
            {
                return Ok(Logic.GetAllVoters());
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpGet]
        [Route("parties")]
        public IActionResult GetAllParties()
        {
            try
            {
                return Ok(Logic.GetAllParties());
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpGet]
        [Route("votes")]
        public IActionResult GetAllVotersPaties()
        {
            try
            {
                return Ok(Logic.GetAllVotersParties());
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpPost]
        [Route("votes")]
        [Authorize]
        public IActionResult AddVote(VotersPartyModel votersPartyModel)
        {
            try
            {
                return Created("", Logic.AddVote(votersPartyModel));
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpGet]
        [Route("report-models")]
        public IActionResult GetAllReportModels()
        {
            try
            {
                return Ok(Logic.GetAllReportModels());
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpGet]
        [Route("images/{fileName}")]
        public IActionResult GetImage(string fileName)
        {
            try
            {
                // Open a stream to the file: 
                FileStream fileStream = System.IO.File.OpenRead("Uploads/" + fileName);

                // Send back the stream to the client: 
                return File(fileStream, "image/jpeg");
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }
    }
}
