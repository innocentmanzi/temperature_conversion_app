# Temperature Conversion App

# Features

1. **Temperature Input:** Users can enter a temperature value using a TextField widget, and TextField accepts numerical input and provides a label "Enter temperature" with an outlined border for better user experience.
2. **Unit Selection:** Users can select the unit of the input temperature from two options: Celsius and Fahrenheit. Another set of radio buttons allows users to select the unit they want to convert to, and it also provides Celsius and Fahrenheit options.
3. **Temperature Conversion:** When users press the "Convert" button, the app converts the input temperature from the selected unit to the desired unit, and The conversion logic handles both Celsius to Fahrenheit and Fahrenheit to Celsius conversions.
4. **Displaying the Converted Value:** The converted temperature value is displayed below the convert button if a valid conversion has been performed, and The converted value is shown in a container with padding for better readability.
5. **Conversion History:** The app maintains a history of all conversions performed during the session, and The history is displayed as a list of ListTile widgets showing the original and converted values in a readable format.
6. **Clear History:** If there are items in the history, a "Clear" button appears, and When pressed, this button clears the conversion history and resets the converted value display.
7. **Responsive Design:** The use of SingleChildScrollView ensures that the content is scrollable if it exceeds the screen height, providing a good user experience on smaller screens.

# Usage

# Widgets Used

1.  **Main function:** Runs the app and sets TemperatureConverterApp as the root widget.
2.  **TemperatureConverterApp:** Sets up the MaterialApp with a title, theme, and TemperatureConverter as the home screen.
3.  **TemperatureConverter:** A stateful widget that manages the state of the temperature conversion functionality.
4.  **_TemperatureConverterState:** Handles the logic and UI for temperature conversion, including taking user input, performing conversions, and maintaining a history of 
  conversions.
5.  **Scaffold:** Provides a structure for the screen, with an app bar and body.
6.  **SingleChildScrollView:** Ensures the content is scrollable if it overflows.
7.  ** Column:** Arrange the various widgets (input field, radio buttons, buttons, and results) vertically.
8.  **TextField:** Allows the user to input the temperature value.
9.  **Radio Buttons:** Let the user select the units for conversion.
10. **ElevatedButton:**  Triggers the conversion when pressed.
11. **Converted Value:** Displays the result of the conversion if available.
12. **ListView.builder:**  Displays the history of conversions.
13. **Clear Button:** Clears the conversion history when pressed.

# Contribution
Please follow the general Contribution Guidelines if you want to contribute to this project.

# License
This project is licensed under the M.I.T. License - see the [LICENSE](https://opensource.org/license/mit) file for more details.

# Contact
For questions or support, please get in touch with us at temperatureconversion@gmail.com

# Credit
Special thanks to Samiratu Ntohsi and the entire B.S.E. coaching staff for inspiration and guidance during the development of this project. This project is a testament to my collective skills and knowledge in the field.

# Author
 1. [Innocent MANZI](https://github.com/innocentmanzi)

