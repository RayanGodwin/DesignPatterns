//
//  ViewController.swift
//  Sample
//
//  Created by Rayan Sequeira on 06/07/18.
//  Copyright © 2018 Rayan Sequeira. All rights reserved.
//

// This entire sample has been picked up from the blog of Dejan Agostini and can be extended to represent the organisational structure of a company.
// Composite pattern is used to represent tree like structure to represent complex hierarchies between objects. Composite hides the complex hierarchy of object structure from client, so that client can handle all the objects uniformly as defined by the abstraction. Example is file structure used on desktops. This is a pattern to build recursive dataType.

import UIKit

protocol Player {
    var name: String! {get}
    var kills: Int! {get}
    
    func move(x: Int, y: Int)
    func shoot(x: Int, y: Int)
    func addPlayer(player: Player)
    func removePlayer(player: Player)
    func find(name: String) -> Player?
}

class Pilot: Player {
    var name: String!
    var kills: Int!
    
    init(name: String, kills: Int) {
        self.name = name
        self.kills = kills
    }
    
    func move(x: Int, y: Int) {
        print("Pilot '\(name)' flying to [\(x):\(y)]")
    }
    
    func shoot(x: Int, y: Int) {
        self.move(x: x, y: y)
        print("Pilot '\(name)' dropping bombs at [\(x):\(y)]")
        if x == y {
            kills = kills + 1
        }
    }
    
    func addPlayer(player: Player) {
        print("Cannot control a player, hence won't be able to add the player")
    }
    
    func removePlayer(player: Player) {
        print("Cannot control a player, hence won't be able to remove the player")
    }
    
    func find(name: String) -> Player? {
        if name == self.name {
            return self
        } else {
            return nil
        }
    }
}

class Commander: Player
{
    var name: String!
    var kills: Int! {
        // A commander cannot kill stuff. His kill count is the agregate of his team.
        return self.players.reduce(0) { $0 + $1.kills }
    }
    
    private var players: [Player] = []
    
    init(name: String) {
        self.name = name
    }
    
    func move(x: Int, y: Int) {
        print("[\(self.name)]: I'm moving my team to [\(x):\(y)]")
        self.players.forEach { $0.move(x: x, y: y) }
    }
    
    func shoot(x: Int, y: Int) {
        print("[\(self.name)]: The guys will be killing as soon as we move to [\(x):\(y)]")
        self.players.forEach { $0.shoot(x: x, y: y) }
    }
    
    func addPlayer(player: Player) {
        guard self.hasPlayer(player) == false else { return }
        self.players.append(player)
    }
    
    func removePlayer(player: Player) {
        if let idx = self.players.index(where: { $0.name == player.name }) {
            self.players.remove(at: idx)
        }
    }
    
    func find(name: String) -> Player? {
        if name == self.name {
            return self
        } else {
            return self.players.filter { $0.find(name: name) != nil }.first
        }
    }
    
    private func hasPlayer(_ player: Player) -> Bool {
        return self.players.contains { $0.name == player.name }
    }
}

class Fleet
{
    var name: String
    var fleetCommander: Player?
    
    init(name: String) {
        self.name = name
        self.fleetCommander = createFleetCommander()
    }
    
    private func createFleetCommander() -> Player
    {
        let redSquad = Commander(name: "Sentinel[SC]")
        redSquad.addPlayer(player: Pilot(name: "Ripper", kills: 44))
        redSquad.addPlayer(player: Pilot(name: "FluffyBunny", kills: 8876))
        redSquad.addPlayer(player: Pilot(name: "Avenger", kills: 56))
        
        let blueSquad = Commander(name: "!crazy[SC]")
        blueSquad.addPlayer(player: Pilot(name: "Daisy", kills: 888))
        blueSquad.addPlayer(player:Pilot(name: "SafeApproach", kills: 9855))
        
        let leftWing = Commander(name: "Redeemer[WC]")
        leftWing.addPlayer(player: redSquad)
        leftWing.addPlayer(player: blueSquad)
        leftWing.addPlayer(player: Pilot(name: "Recon1", kills: 2))
        leftWing.addPlayer(player: Pilot(name: "Guardian", kills: 66))
        
        let orangeSquad = Commander(name: "PrettyPurple[SC]")
        orangeSquad.addPlayer(player: Pilot(name: "ComeCloser", kills: 9956))
        orangeSquad.addPlayer(player: Pilot(name: "N00bGone", kills: 588))
        
        let greenSquad = Commander(name: "TheGardener[SC]")
        greenSquad.addPlayer(player: Pilot(name: "MammaMia", kills: 8875))
        greenSquad.addPlayer(player: Pilot(name: "RedRooster", kills: 421))
        
        let rightWing = Commander(name: "Goldsnake[WC]")
        rightWing.addPlayer(player: orangeSquad)
        rightWing.addPlayer(player: greenSquad)
        rightWing.addPlayer(player: Pilot(name: "Logi", kills: 42))
        
        let fleetCommander = Commander(name: "Ramzes[FC]")
        fleetCommander.addPlayer(player: leftWing)
        fleetCommander.addPlayer(player: rightWing)
        fleetCommander.addPlayer(player: Pilot(name: "Praetorian", kills: 76))
        fleetCommander.addPlayer(player: Pilot(name: "Assassin", kills: 55))
        
        return fleetCommander
    }
    
    func moveFleet(x: Int, y: Int) {
        self.fleetCommander?.move(x: x, y: y)
    }
    
    func fleetFire(x: Int, y: Int) {
        self.fleetCommander?.shoot(x: x, y: y)
    }
    
    func move(playerName name: String, x: Int, y: Int) {
        self.fleetCommander?.find(name: name)?.move(x: x, y: y)
    }
    
    func fire(playerName name: String, x: Int, y: Int) {
        self.fleetCommander?.find(name: name)?.shoot(x: x, y: y)
    }
    
    func fleetStats() {
        print("FC kills: \(self.fleetCommander?.kills ?? 0)")
    }
    
    func stats(playerName name: String) {
        if let player = self.fleetCommander?.find(name: name) {
            print("[\(player.name)]: Kills - \(player.kills)")
        } else {
            print("No player with that name")
        }
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fleet = Fleet(name: "Golden Fleet")
        fleet.moveFleet(x: 8, y: 7)
        fleet.fleetFire(x: 3, y: 3)
        
        fleet.move(playerName: "Redeemer[WC]", x: 4, y: 9)
        fleet.fire(playerName: "TheGardener[SC]", x: 9, y: 9)
        fleet.fire(playerName: "Avenger", x: 8, y: 8)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

