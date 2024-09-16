## Steps to Run the Project

### The project uses the flutter_dotenv package to manage environment variables.

	1.	Create a .env file in the project’s root.
 	2.	Open the .env file and configure the variable: API_KEY='your_api_key_here'.  

### This project uses the freezed package and build_runner to generate supporting code. Run the following command to generate the required files:
	1.	flutter pub run build_runner build --delete-conflicting-outputs
