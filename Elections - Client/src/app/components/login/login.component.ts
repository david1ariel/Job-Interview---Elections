import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Unsubscribe } from 'redux';
import { CredentialsModel } from 'src/app/models/credentials-model';
import { VoterModel } from 'src/app/models/voter-model';
import { store } from 'src/app/redux/store';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  stringDate: string;
  credentials: CredentialsModel = new CredentialsModel();
  voter: VoterModel;
  unsubscribe: Unsubscribe

  constructor(private authService: AuthService, private router: Router) { }

  ngOnInit(): void {
    this.unsubscribe = store.subscribe(()=>{
      this.voter = store.getState().voter
    });
  }
  async login(){
    console.log(this.credentials)
    // const date = new Date(this.stringDate);
    // this.credentials.idProdDate = date;
    const success = await this.authService.login(this.credentials);
    if(success)
      alert('Now you are logged In!');
    this.router.navigateByUrl('/home')
  }
}
