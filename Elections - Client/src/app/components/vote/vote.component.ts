import { Component, OnInit } from '@angular/core';
import { Unsubscribe } from 'redux';
import { PartyModel } from 'src/app/models/party-model';
import { VoteModel } from 'src/app/models/vote-model';
import { VoterModel } from 'src/app/models/voter-model';
import { store } from 'src/app/redux/store';
import { ElectionsService } from 'src/app/services/elections.service';

@Component({
  selector: 'app-vote',
  templateUrl: './vote.component.html',
  styleUrls: ['./vote.component.css']
})
export class VoteComponent implements OnInit {

  parties: PartyModel[] = store.getState().parties;
  ubsubscribe: Unsubscribe;
  partySelected: PartyModel = new PartyModel();
  vote: VoteModel = new VoteModel();
  voter: VoterModel = store.getState().voter;

  constructor(private electionsService: ElectionsService) { }

  async ngOnInit() {
    this.ubsubscribe = store.subscribe(() => {
      this.voter = store.getState().voter;
      this.parties = store.getState().parties;
    });
    if (store.getState().parties.length === 0) {
      await this.electionsService.getAllParties().then(() => {
        console.log(this.parties);
      });
    }
  }

  async sendVote() {
    this.vote.partyId = this.partySelected.partyId;
    this.vote.voterId = this.voter.voterId;
    console.log(this.vote);
    const success = await this.electionsService.addVote(this.vote);
    if(success)
      alert('הצבעתך נרשמה במערכת');
  }


}
