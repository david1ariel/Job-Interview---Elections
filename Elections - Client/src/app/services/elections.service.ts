import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { PartyModel } from '../models/party-model';
import { ReportModel } from '../models/report-model';
import { VoteModel } from '../models/vote-model';
import { VoterModel } from '../models/voter-model';
import { ActionType } from '../redux/action-type';
import { store } from '../redux/store';

@Injectable({
  providedIn: 'root'
})
export class ElectionsService {

  constructor(private http: HttpClient) { }

  public async getAllParties(): Promise<boolean> {
    try {
      const parties = await this.http.get<PartyModel[]>(environment.baseUrl + "/elections/parties").toPromise();
      store.dispatch({ type: ActionType.GetAllParties, payload: parties });
      return true;
    }
    catch (error) {
      console.dir(error);
      return false;
    }
  }

  public async getAllVoters(): Promise<boolean> {
    try {
      const voters = await this.http.get<VoterModel[]>(environment.baseUrl + "/elections/voters").toPromise();
      store.dispatch({ type: ActionType.GetAllVoters, payload: voters });
      return true;
    }
    catch (error) {
      console.dir(error);
      return false;
    }
  }

  public async getAllVotes(): Promise<boolean> {
    try {
      const votes: VoteModel[] = await this.http.get<VoteModel[]>(environment.baseUrl + "/elections/votes").toPromise();
      store.dispatch({ type: ActionType.GetAllParties, payload: votes });
      return true;
    }
    catch (error) {
      console.dir(error);
      return false;
    }
  }

  public async getAllReportModels(): Promise<boolean> {
    try {
      const reportModels: ReportModel[] = await this.http.get<VoteModel[]>(environment.baseUrl + "/elections/report-models").toPromise();
      store.dispatch({ type: ActionType.getAllReportModels, payload: reportModels });
      return true;
    }
    catch (error) {
      console.dir(error);
      return false;
    }
  }

  public async addVote(vote: VoteModel): Promise<boolean> {
    try {
      const addedVote = await this.http.post<VoteModel>(environment.baseUrl + "/elections/votes", vote).toPromise();
      store.dispatch({ type: ActionType.AddVote, payload: addedVote });
      return true;
    }
    catch (error) {
      console.dir(error);
      return false;
    }
  }
}
