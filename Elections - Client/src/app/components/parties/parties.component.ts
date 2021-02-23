import { Component, OnInit } from '@angular/core';
import { Unsubscribe } from 'redux';
import { PartyModel } from 'src/app/models/party-model';
import { store } from 'src/app/redux/store';
import { ElectionsService } from 'src/app/services/elections.service';

@Component({
  selector: 'app-parties',
  templateUrl: './parties.component.html',
  styleUrls: ['./parties.component.css']
})
export class PartiesComponent implements OnInit {

  parties: PartyModel[] = store.getState().parties;
  unsubscribe: Unsubscribe;

  constructor(private electionsService: ElectionsService) { }

  async ngOnInit() {
    this.unsubscribe = store.subscribe(() =>
      this.parties = store.getState().parties
    );
    if (store.getState().parties.length === 0) {
      await this.electionsService.getAllParties();
    }
  }

}
