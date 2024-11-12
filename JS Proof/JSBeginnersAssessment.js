/*
Assessment Requirements
1. Create a variable that can hold a number of NFT's. What type of variable might this be?
2. Create an object inside your mintNFT function that will hold the metadata for your NFTs. 
   The metadata values will be passed to the function as parameters. When the NFT is ready, 
   you will store it in the variable you created in step 1
3. Your listNFTs() function will print all of your NFTs metadata to the console (i.e. console.log("Name: " + someNFT.name))
4. For good measure, getTotalSupply() should return the number of NFT's you have created
*/

// create a variable to hold your NFT's

const arrNFT = []

// this function will take in some values as parameters, create an
// NFT object using the parameters passed to it for its metadata, 
// and store it in the variable above.
function mintNFT (name, type, price){
    const objNFT = {
        "nameNFT" : name,
        "typeNFT" : type,
        "priceNFT" : price
    };
    arrNFT.push(objNFT);
}

// create a "loop" that will go through an "array" of NFT's
// and print their metadata with console.log()
function listNFTs () {
    for(let i = 0; i < arrNFT.length; i++){
        console.log(arrNFT[i]);
    }
}

// print the total number of NFTs we have minted to the console
function getTotalSupply() {
    console.log(arrNFT.length);
}

// call your functions below this line

mintNFT("Mercury", "Art", 100);
mintNFT("Venus", "Art", 100);
mintNFT("Earth", "Dying", 10000000000000000);
mintNFT("Mars", "Art", 100);
mintNFT("Jupiter", "Art", 100);
mintNFT("Saturn", "Art", 100);
mintNFT("Uranus", "heh~", 9000);
mintNFT("Neptune", "Art", 100);

listNFTs();

getTotalSupply();
