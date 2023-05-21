<!-- Github Username Checker -->
## Github Username Checker

a simple bash script that allows you to check a set list of github usernames to see if they are avaliable. requires your own list of usernames to be checked via a `.txt` file. some example lists are given in the repo. 


<!-- GETTING STARTED -->

### Installation

1. Create a free personal access token using github's [instructions](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
2. Clone the repo

   ```sh
   git clone https://github.com/xihn/github-checker.git
   ```
3. Create executible

   ```sh
   chmod +x script.sh
   ```
4. Enter your API in `token.txt`
5. Run the script, replacing `listfile` with the `.txt` list of usernames and `outputfile` with the `.txt` the name of the output list. 

   ```sh
   ./checker.sh listfile outputfile
   ```


