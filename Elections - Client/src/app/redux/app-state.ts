import { PartyModel } from "../models/party-model";
import { ReportModel } from "../models/report-model";
import { VoterModel } from "../models/voter-model";


export class AppState {

  public voter: VoterModel;
  public voters: VoterModel[] =[];
  public parties: PartyModel[] = [];
  public votes: VoterModel[] = [];
  public reportModels: ReportModel[]=[]


  public constructor() {
    this.voter = JSON.parse(sessionStorage.getItem("voter"));
  }





}
