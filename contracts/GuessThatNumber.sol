pragma version >=0.8.0;
import "@openzeppelin/contracts/access/Ownable.sol";


contract GuessThatNumber is Ownable {
    uint8 private numOfGuesses = 0 ;
    uint8 private maxBet = 10;
    uint8 private costOfEachBet = 0.00001;
    mapping(address => uint8[3]) private userGuesses;

    event MaxBetReached();

    constructor(_maxBet) {
        maxBet = _maxBet;
    }

    modifier checkNumOfGuesses() {
        require(numOfGuesses <= maxBet);
        _;
    }
    
    function _setGuess(_guess) private checkNumOfGuesses{
        userGuesses[msg.sender] = _guess;
        numOfGuesses++;
    }

    function setMaxBet(_maxBet) public onlyOwner{
        maxBet = _maxBet;
    }

     function setCostOfEachBet(_costOfEachBet) public onlyOwner{
        costOfEachBet = _costOfEachBet;
    }
    
}