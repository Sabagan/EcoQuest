import 'package:ecoquest/components/app_button.dart';
import 'package:ecoquest/model/challenge.dart';
import 'package:ecoquest/styles/app_text.dart';
import 'package:ecoquest/utils/app_routes.dart';
import 'package:ecoquest/utils/challenge_preferences.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = false;

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
              child: Column(
                children: [
          const Spacer(),
          const Text("Welcome", style: AppText.buttonTextStyle,),
          const SizedBox(height: 16,),
          const Text(
            "Thank you for your contributions! Click on the button below to start getting quests. Click the reroll button for new quests.", 
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16
            ),  
          ),
          const SizedBox(height: 36,),
          AppButton(
            buttonText: "Continue",
            onPressed: () {
              for (var challenge in challengesList) {
                ChallengePreferences.addChallenge(Challenge(
                  title: challenge['title'],
                  description: challenge['description'],
                  active: false,
                  image: 'assets/images/${challenge['id'] <= 30 ? challenge['id']:51}.png' // Assuming active is always false initially
                ));
              }
          
              ChallengePreferences.activateRandomChallenge();
          
              ChallengePreferences.printChallengeList();
          
              Navigator.of(context).pushReplacementNamed(AppRoutes.mainPage);
            },
            textColor: isDarkMode ? Colors.white : Colors.black,
          ),
          const Spacer()
                ],
              )),
        ));
  }
}

List<Map<String, dynamic>> challengesList = [
  {
    "id": 1,
    "title": "Lightning Shower",
    "description": "Reduce shower time to 5 minutes.",
    "difficulty": 2,
    "image": "An image of a timer next to a showerhead."
  },
  {
    "id": 2,
    "title": "Lights Out",
    "description": "Turn off lights when leaving a room.",
    "difficulty": 1,
    "image":
        "An image of boxes (rooms) in a 2x2 grid, where ONLY one of them is lit."
  },
  {
    "id": 3,
    "title": "Bottle Buddy",
    "description": "Use a reusable water bottle.",
    "difficulty": 1,
    "image": "An image of a bottle with a tree logo on it"
  },
  {
    "id": 4,
    "title": "Bag Brigade",
    "description": "Bring a reusable bag for shopping.",
    "difficulty": 1,
    "image": "An image of a grocery bag with a tree logo with groceries inside."
  },
  {
    "id": 5,
    "title": "Green Bulbs",
    "description": "Switch to energy-efficient light bulbs.",
    "difficulty": 2,
    "image": "An image of a bulb where the glass part is just a tree."
  },
  {
    "id": 6,
    "title": "Tree Hugger",
    "description": "Plant a tree.",
    "difficulty": 4,
    "image": "An image of a sapling being planted in soil."
  },
  {
    "id": 7,
    "title": "Veggie Victory",
    "description": "Go meat-free for a day.",
    "difficulty": 2,
    "image": "An image of a colorful plate of vegetables."
  },
  {
    "id": 8,
    "title": "Eco Tides",
    "description": "Use public transportation or carpool.",
    "difficulty": 3,
    "image": "An image of a bus or carpooling group."
  },
  {
    "id": 9,
    "title": "Compost King",
    "description": "Start a compost bin.",
    "difficulty": 3,
    "image": "An image of a compost bin with food scraps."
  },
  {
    "id": 10,
    "title": "Anti-Polymer",
    "description": "Avoid single-use plastics",
    "difficulty": 4,
    "image": "An image of a crushed water bottle with a prohibition sign."
  },
  {
    "id": 11,
    "title": "Recycle Rockstar",
    "description": "Recycle paper, plastic, and glass.",
    "difficulty": 1,
    "image": "An image of 3 coloured recycling bins with sorted materials."
  },
  {
    "id": 12,
    "title": "Walk 'n' Roll",
    "description": "Take a walk or bike instead of driving.",
    "difficulty": 2,
    "image": "An image of shoes and an image of a bike."
  },
  {
    "id": 13,
    "title": "Cup Crusader",
    "description": "Use a reusable coffee cup.",
    "difficulty": 1,
    "image": "An image of a reusable coffee cup."
  },
  {
    "id": 14,
    "title": "Closet Champ",
    "description": "Donate old clothes instead of throwing them away.",
    "difficulty": 2,
    "image": "An image of a box with a donation symbol filled with clothes."
  },
  {
    "id": 15,
    "title": "Neighborhood Ninja",
    "description": "Pick up litter in your neighborhood.",
    "difficulty": 2,
    "image": "An image of a neighbourhood sidewalk with sparkle stars."
  },
  {
    "id": 16,
    "title": "Breeze Master",
    "description": "Use a clothesline instead of a dryer.",
    "difficulty": 2,
    "image": "An image of clothes hanging on a clothesline."
  },
  {
    "id": 17,
    "title": "Meal-Prep Madness",
    "description": "Reduce food waste by planning meals.",
    "difficulty": 3,
    "image": "An image of a meal plan on a calendar."
  },
  {
    "id": 18,
    "title": "Green Energy Guru",
    "description": "Switch to a green energy provider.",
    "difficulty": 4,
    "image": "An image of a solar panel or wind turbine."
  },
  {
    "id": 19,
    "title": "Unplugged Explorer",
    "description": "Take a day off from using electronics.",
    "difficulty": 3,
    "image":
        "An image of a picnic mat with the picnic basket that has food in it."
  },
  {
    "id": 20,
    "title": "Market Marvel",
    "description": "Support a local farmer's market.",
    "difficulty": 2,
    "image": "An image of a bustling farmer's market with fresh produce."
  },
  {
    "id": 21,
    "title": "Palm Oil Paladin",
    "description": "Avoid products with palm oil.",
    "difficulty": 3,
    "image":
        "An image of a product ingredient list with a prohibition sign on a palm tree."
  },
  {
    "id": 22,
    "title": "Secondhand Superstar",
    "description": "Buy second-hand items instead of new ones.",
    "difficulty": 2,
    "image": "An image of a thrift store or second-hand shop."
  },
  {
    "id": 23,
    "title": "Showerhead Superstar",
    "description": "Install a water-saving showerhead.",
    "difficulty": 3,
    "image": "An image of a showerhead and an image of a water meter."
  },
  {
    "id": 24,
    "title": "Green Clean",
    "description": "Use natural cleaning products.",
    "difficulty": 2,
    "image": "An image of cleaning products each with a tree logo on it."
  },
  {
    "id": 25,
    "title": "Garden Guardian",
    "description": "Grow your own herbs or vegetables.",
    "difficulty": 4,
    "image": "An image of a small farm in the backyard of a home."
  },
  {
    "id": 26,
    "title": "Eco Scholar",
    "description": "Educate yourself about an environmental issue.",
    "difficulty": 2,
    "image": "An image of an open book with diagrams of the environment."
  },
  {
    "id": 27,
    "title": "Charity Champion",
    "description": "Donate to an environmental charity.",
    "difficulty": 2,
    "image": "An image of charity money on a tree."
  },
  {
    "id": 28,
    "title": "Packaging Prodigy",
    "description": "Avoid products with excessive packaging.",
    "difficulty": 3,
    "image": "An image of an amazon shipping box"
  },
  {
    "id": 29,
    "title": "Event Enthusiast",
    "description": "Participate in a local environmental event.",
    "difficulty": 3,
    "image": "An image of a plastic bottle being picked up by a tool."
  },
  {
    "id": 30,
    "title": "Paperless Pioneer",
    "description": "Switch to paperless billing.",
    "difficulty": 2,
    "image": "An image of a laptop screen showing an online billing statement."
  },
];
