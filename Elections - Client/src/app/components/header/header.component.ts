import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Unsubscribe } from 'redux';
import { CredentialsModel } from 'src/app/models/credentials-model';
import { VoterModel } from 'src/app/models/voter-model';
import { store } from 'src/app/redux/store';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  public greetings = this.getGreetings();
  public voter: VoterModel = store.getState().voter;
  public credentials: CredentialsModel = new CredentialsModel();
  public unsubscribe: Unsubscribe;

  constructor(private router: Router, private authService: AuthService) { }

  ngOnInit(): void {
    this.unsubscribe = store.subscribe(()=>{
      this.voter = store.getState().voter
    });
  }
  private getGreetings(): string {
    return "Hello " + (this.voter ? this.voter.fullName : "אורח");
  }

  voteNow(){
    if(this.voter)
      this.router.navigateByUrl('/vote');
    else
      alert('על מנת להצביע, עליך לבצע כניסה למערכת. לחץ על "כניסה", ולאחר מכן נסה שוב');
  }

  async logout() {
    await this.authService.logout();
    this.router.navigateByUrl("/home");
  }
}
