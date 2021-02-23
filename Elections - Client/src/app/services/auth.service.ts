import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { CredentialsModel } from '../models/credentials-model';
import { VoterModel } from '../models/voter-model';
import { ActionType } from '../redux/action-type';
import { store } from '../redux/store';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private http: HttpClient) { }

  public async login(credentials: CredentialsModel): Promise<boolean> {
    try {
      const loggedInUser:VoterModel = await this.http.post<VoterModel>(environment.baseUrl + "/auth/login", credentials).toPromise();
      store.dispatch({ type: ActionType.Login, payload: loggedInUser });
      return true;
    }
    catch (error) {
      console.log(error)
      return false;
    }
  }

  public logout(): void {
    store.dispatch({ type: ActionType.Logout });
  }
}
