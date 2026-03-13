// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Warhammer 40K Faction Lore – pure text, no funds, no wallet interaction
/// @notice Stores the name of a faction, its leader, and its mission.
/// @dev No payable functions, no selfdestruct, no external calls.

contract FactionLore {

    /// @notice Name of the faction (e.g., Craftworld, Regiment, Chapter, Hive Fleet).
    string public factionName;

    /// @notice Leader, commander, primarch, seer council, etc.
    string public factionLeader;

    /// @notice Mission, purpose, or doctrine of the faction.
    string public factionMission;

    /// @notice Emitted whenever someone updates the faction lore.
    event FactionUpdated(
        address indexed by,
        string newFaction,
        string newLeader,
        string newMission
    );

    constructor() {
        // Default example: 117th Cadian Iron Line (Imperial Guard)
        factionName = "117th Cadian Iron Line";
        factionLeader = "Commissar-Major Varus Keldran";
        factionMission = "To hold critical fronts across the frontier worlds, buying time for the Imperium through unbreakable defense and unwavering sacrifice.";
    }

    /// @notice Update the faction name, leader, and mission.
    /// @dev Anyone can call this; it only updates text.
    /// @param newFaction The new faction name.
    /// @param newLeader The new leader or commander.
    /// @param newMission The new mission or purpose.
    function updateFaction(
        string calldata newFaction,
        string calldata newLeader,
        string calldata newMission
    ) external {
        factionName = newFaction;
        factionLeader = newLeader;
        factionMission = newMission;

        emit FactionUpdated(msg.sender, newFaction, newLeader, newMission);
    }

    /// @notice Returns a combined lore description.
    /// @return description A single string summarizing the faction, its leader, and mission.
    function describeFaction() external view returns (string memory description) {
        description = string(
            abi.encodePacked(
                "Faction: ",
                factionName,
                ". Leader: ",
                factionLeader,
                ". Mission: ",
                factionMission
            )
        );
    }
}
