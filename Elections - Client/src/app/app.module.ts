import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http'
import { CommonModule } from '@angular/common'

import { AppRoutingModule } from './app-routing.module';
import { VotersComponent } from './components/voters/voters.component';
import { PartiesComponent } from './components/parties/parties.component';
import { VoteComponent } from './components/vote/vote.component';
import { HomeComponent } from './components/home/home.component';
import { LayoutComponent } from './components/layout/layout.component';
import { HeaderComponent } from './components/header/header.component';
import { FormsModule } from '@angular/forms';
import { LoginComponent } from './components/login/login.component';
import { JwtInterceptorService } from './services/jwt-interceptor.service';
import { SystemReportComponent } from './components/system-report/system-report.component';


@NgModule({
  declarations: [
    VotersComponent,
    PartiesComponent,
    VoteComponent,
    HomeComponent,
    LayoutComponent,
    HeaderComponent,
    LoginComponent,
    SystemReportComponent,

  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    CommonModule
  ],
  providers: [

    {
      provide: HTTP_INTERCEPTORS,
      useClass: JwtInterceptorService,
      multi: true
    }
  ],
  bootstrap: [LayoutComponent]
})
export class AppModule { }
