pragma solidity ^0.6.0;

contract one{
    //Basic declared variables
    uint score = 0;
    bool isPlayAllowed = true;
    // Declared randomVar variable that is used for generating random Number
    // Creating extra security for more compplex random number
    uint256 private randomVar = ( block.timestamp + block.difficulty ) %100;
    // Calling function to generate a random number between 1 to 6
    function getRandomNumber() private returns (uint256) {
        randomVar = (randomVar + block.timestamp + block.difficulty) % 6 + 1;
        return randomVar;
    }

    // Resets all old score and starts a new game
    function Reset_Game() public {
        score = 0;
        isPlayAllowed = true;
    }

    function Play(uint ball) public returns (uint a, string memory) {
        if(isPlayAllowed)
        {
            //Computer will guess a random number that will be stored here
            //Variable bat is used for computer's guessed number
            uint bat = getRandomNumber();

            // Number (0) is used in case User don't want to play more and wan to exit
            if(ball == 0)
            {
                isPlayAllowed = false;
                return (score, "Game Stopped!");
            }
            //Condition for computer to "OUT"
            else if( ball == bat )
            {
                isPlayAllowed = false;
                return (score, "OUT");
            }
            //Computer scores "RUN"
            else
            {
                score += bat;
                return (bat, "RUNS");
            }
        }
        // When player is "OUT" no new ball will be played until Reset() is called
        else
            return (0, "Please Reset to play again...");
    }

}