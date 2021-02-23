import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { LoginComponent } from './components/login/login.component';
import { PartiesComponent } from './components/parties/parties.component';
import { SystemReportComponent } from './components/system-report/system-report.component';
import { VoteComponent } from './components/vote/vote.component';
import { VotersComponent } from './components/voters/voters.component';
import { LoginGuardService } from './services/login-guard.service';

const routes: Routes = [
  {path: '', component: HomeComponent},
  {path: 'home', component: HomeComponent},
  {path: 'login', component: LoginComponent},
  {path: 'parties', component: PartiesComponent},
  {path: 'voters', component: VotersComponent},
  {path: 'voters', component: VotersComponent},
  {path: 'system-report', component: SystemReportComponent},
  {path: 'vote', canActivate: [LoginGuardService], component: VoteComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
