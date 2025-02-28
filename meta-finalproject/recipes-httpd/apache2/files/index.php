<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dropdown and On/Off Selection</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
        }
        form {
            max-width: 300px;
        }
        label {
            font-size: 16px;
            margin-bottom: 10px;
            display: block;
        }
        select, button {
            font-size: 14px;
            padding: 5px 10px;
            margin-bottom: 20px;
            width: 100%;
        }
    </style>
</head>
<body>
    <h2>Submit Dropdown and On/Off Selection</h2>
    <form method="POST" action="">
        <!-- Dropdown Menu -->
        <label for="dropdown">Choose a number (1 to 20):</label>
        <select id="dropdown" name="dropdown" required>
            <?php
            // Generate dropdown options dynamically
            for ($i = 1; $i <= 20; $i++) {
                echo "<option value='$i'>$i</option>";
            }
            ?>
        </select>

        <!-- On/Off Selection -->
        <label for="on_off">Toggle On/Off:</label>
        <select id="on_off" name="on_off" required>
            <option value="On">On</option>
            <option value="Off">Off</option>
        </select>

        <button type="submit">Submit</button>
    </form>

    <?php
    // Handle form submission
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        $dropdownValue = $_POST['dropdown'];
        $onOffValue = $_POST['on_off'];

        echo "<h3>Submitted Values:</h3>";
        echo "<p><strong>Selected Number:</strong> $dropdownValue</p>";
        echo "<p><strong>On/Off Selection:</strong> $onOffValue</p>";
    }
    ?>
</body>
</html>
