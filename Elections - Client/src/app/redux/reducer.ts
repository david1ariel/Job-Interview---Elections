import { environment } from 'src/environments/environment';
import { AppState } from './app-state';
import { Action } from './action';
import { ActionType } from './action-type';
import { store } from './store';




export function reducer(currentState: AppState, action: Action): AppState {

  const newState = { ...currentState }; // Spread Operator

  switch (action.type) {

    case ActionType.Login: {
      newState.voter = action.payload;
      if (newState.voter)
        sessionStorage.setItem("voter", JSON.stringify(newState.voter));
      break;
    }

    case ActionType.Logout: {
      newState.voter = null;
      sessionStorage.removeItem("voter");
      break;
    }

    case ActionType.GetAllVoters: {
      newState.voters = action.payload;
      break;
    }

    case ActionType.GetAllParties: {
      for(const party of action.payload) {
        party.imageFileName = environment.baseUrl + "/elections/images/" + party.imageFileName;
    }
      newState.parties = action.payload;
      break;
    }

    case ActionType.GetAllVotes: {
      newState.votes = action.payload;
      break;
    }

    case ActionType.getAllReportModels: {
      newState.reportModels = action.payload;
      break;
    }

    case ActionType.AddVote: {
      newState.votes.push(action.payload);
      break;
    }

  }

  return newState;
}


