import { Component, OnInit } from '@angular/core';
import { Unsubscribe } from 'redux';
import { VoterModel } from 'src/app/models/voter-model';
import { store } from 'src/app/redux/store';
import { ElectionsService } from 'src/app/services/elections.service';

@Component({
  selector: 'app-voters',
  templateUrl: './voters.component.html',
  styleUrls: ['./voters.component.css']
})
export class VotersComponent implements OnInit {

  voters: VoterModel[] = store.getState().voters;
  unsubscribe: Unsubscribe;

  constructor(private electionsService: ElectionsService) { }

  async ngOnInit() {
    this.unsubscribe = store.subscribe(() =>
      this.voters = store.getState().voters
    );
    if (store.getState().voters.length === 0) {
      const success = await this.electionsService.getAllVoters();
      if(success)
      console.log(this.voters);
    }
  }

}
