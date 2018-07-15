//iOS Unit 1 Project - Soccer League Coordinator

//Benjamin Butterworth



//players Information

let player1: [String: Any] = ["name": "Joe Smith", "height": 42.0, "experience": true, "guardians": "Jim and Jan Smith"]

let player2: [String: Any] = ["name": "Jill Tanner", "height": 36.0, "experience": true, "guardians": "Clara Tanner"]

let player3: [String: Any] = ["name": "Bill Bon", "height": 43.0, "experience": true, "guardians": "Sara and Jenny Bon"]

let player4: [String: Any] = ["name": "Evan Gordon", "height": 45.0, "experience": false, "guardians": "Wendy and Mike Gordon"]

let player5: [String: Any] = ["name": "Matt Gill", "height": 40.0, "experience": false, "guardians": "Charles and Sylvia Gill"]

let player6: [String: Any] = ["name": "Kimmy Stein", "height": 41.0, "experience": false, "guardians": "Bill and Hillary Stein"]

let player7: [String: Any] = ["name": "Sammy Adams", "height": 45.0, "experience": false, "guardians": "Jeff Adams"]

let player8: [String: Any] = ["name": "Karl Saygan", "height": 42.0, "experience": true, "guardians": "Heather Bledsoe"]

let player9: [String: Any] = ["name": "Suzane Greenberg", "height": 44.0, "experience": true, "guardians": "Henrietta Dumas"]

let player10: [String: Any] = ["name": "Sal Dali", "height": 41.0, "experience": false, "guardians": "Gala Dali"]

let player11: [String: Any] = ["name": "Joe Kavalier", "height": 39.0, "experience": false, "guardians": "Sam and Elaine Kavalier"]

let player12: [String: Any] = ["name": "Ben Finkelstein", "height": 44.0, "experience": false, "guardians": "Aaron and Jill Finkelstein"]

let player13: [String: Any] = ["name": "Diego Soto", "height": 41.0, "experience": true, "guardians": "Robin and Sarika Soto"]

let player14: [String: Any] = ["name": "Chloe Alaska", "height": 47.0, "experience": false, "guardians": "David and Jamie Alaska"]

let player15: [String: Any] = ["name": "Arnold Willis", "height": 43.0, "experience": false, "guardians": "Claire Willis"]

let player16: [String: Any] = ["name": "Phillip Helm", "height": 44.0, "experience": true, "guardians": "Thomas Helm and Eva Jones"]

let player17: [String: Any] = ["name": "Les Clay", "height": 42.0, "experience": true, "guardians": "Wynonna Brown"]

let player18: [String: Any] = ["name": "Herschel Krustofski", "height": 45.0, "experience": true, "guardians": "Hyman and Rachel Krustofski"]


//groups for players with soccer experience and player without soccer experience

var experiencedPlayers: [[String: Any]] = []

var inexperiencedPlayers: [[String: Any]] = []


//the 3 teams in the soccer league

var teamDragons: [[String: Any]] = []

var teamSharks: [[String: Any]] = []

var teamRaptors: [[String: Any]] = []


//Grouping the players together into 1 collection(an array of dictionaries) and adding the players to theLeague variable

let players = [player1, player2, player3, player4, player5,
               player6, player7, player8, player9, player10,
               player11, player12, player13, player14, player15, player16, player17, player18]


var theLeague: [[String: Any]] = []
theLeague += players


//grouping the teams together to create an all teams in the leauge variable

var teams = [teamSharks, teamRaptors, teamDragons]
var allTeams = teams.count


//iterating through the players array and adding them to the proper grouping of experienced players and inexperienced players

for player in players {
    if let experience = player["experience"] as? Bool {
        if experience == true {
            experiencedPlayers.append(player)
        } else {
            inexperiencedPlayers.append(player)
            
        }
    }
}


//creating the number of maximum players allowed on every team with experience and without experience.  using proper math ratios instead of implementing magic numbers in the logic

let maxExperiencedPlayers = experiencedPlayers.count / allTeams

let maxInexperiencedPlayers = inexperiencedPlayers.count / allTeams


experiencedPlayers.count
inexperiencedPlayers.count


//distributing the players with experience and without experience between all 3 teams evenly

for expTeamMembers in experiencedPlayers {
    if teamSharks.count < maxExperiencedPlayers {
        teamSharks.append(expTeamMembers)
        
    } else if teamDragons.count < maxExperiencedPlayers {
        teamDragons.append(expTeamMembers)
        
    } else if teamRaptors.count < maxExperiencedPlayers {
        teamRaptors.append(expTeamMembers)
    }
}

teamSharks.count
teamDragons.count
teamRaptors.count


//maxInexperiencedPlayers + maxExperiencedPlayers is necessary otherwise this for loop wouldn't execute because there are already 3 players grouped on each team at this point (as seen in the teamSharks.count) using the addition operator allows for the full team amount of 6 players to each team, which are composed of both experienced players and inexperienced players

for inexpTeamMembers in inexperiencedPlayers {
    if teamSharks.count < maxInexperiencedPlayers + maxExperiencedPlayers {
        teamSharks.append(inexpTeamMembers)
        
    } else if teamDragons.count < maxInexperiencedPlayers + maxExperiencedPlayers {
        teamDragons.append(inexpTeamMembers)
        
    } else if teamRaptors.count < maxInexperiencedPlayers + maxExperiencedPlayers {
        teamRaptors.append(inexpTeamMembers)
    }
    
}


teamSharks.count
teamDragons.count
teamRaptors.count


//setting each team's practice schedule

let teamDragonsPractice = "March 17, 1pm"
let teamSharksPractice = "March 17, 3pm"
let teamRaptorsPractice = "March 18, 1pm"


//creating a variable to hold all of the teams' letters

var leagueLetters: [[String]] = []


//creating a variable for each individual team

var teamSharkLetters: [String] = []
var teamDragonsLetters: [String] = []
var teamRaptorsLetters: [String] = []


//extracting the values from the array of dictionaries required to complete the team letters being sent to each guardian in reference to their soccer practice schedule

for sharks in teamSharks {
    if let playerName = sharks["name"] as? String, let guardianName = sharks["guardians"] as? String {
        let sharksLetter = "Dear \(guardianName), \(playerName) on the team Sharks has practice on \(teamSharksPractice). We look forward to our first practice session and having fun this year!"
        
        teamSharkLetters.append(sharksLetter)
    }
}

teamSharkLetters.count




for dragons in teamDragons {
    if let playerName = dragons["name"] as? String, let guardianName = dragons["guardians"] as? String {
        let dragonsLetter = "Dear \(guardianName), \(playerName) on the team Sharks has practice on \(teamDragonsPractice). We look forward to our first practice session and having fun this year!"
        
        teamDragonsLetters.append(dragonsLetter)
    }
}

teamDragonsLetters.count



for raptors in teamRaptors {
    if let playerName = raptors["name"] as? String, let guardianName = raptors["guardians"] as? String {
        let raptorsLetter = "Dear \(guardianName), \(playerName) on the team Sharks has practice on \(teamRaptorsPractice). We look forward to our first practice session and having fun this year!"
        
        teamRaptorsLetters.append(raptorsLetter)
    }
}

teamRaptorsLetters.count


//adding the team letters to the letters for the league

leagueLetters = [teamDragonsLetters + teamSharkLetters + teamSharkLetters]


// printing each individual letter seperately

for i in leagueLetters {
    print(i)
}



//END

