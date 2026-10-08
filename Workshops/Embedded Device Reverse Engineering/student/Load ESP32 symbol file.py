# Load ESP32 symbol file
from ghidra.program.model.symbol import SourceType
import os

def run():
    # 1. Ask the user to select the symbols.txt file
    # 'askFile' is a Ghidra helper that opens a native file dialog
    f = askFile("Select symbols.txt file", "Load Symbols")
    
    if not os.path.exists(f.absolutePath):
        print("Error: File not found.")
        return

    print("Loading symbols from: " + f.absolutePath)

    # Counter for success
    count = 0

    # 2. Read the file line by line
    with open(f.absolutePath, 'r') as file:
        for line in file:
            line = line.strip()
            
            # Skip empty lines
            if not line:
                continue

            # 3. Parse the 'nm' format: ADDRESS TYPE NAME
            # Example: 400d0018 T app_main
            parts = line.split()
            
            # integrity check
            if len(parts) < 3:
                print("Skipping malformed line: " + line)
                continue

            addr_str = parts[0] # The Hex Address
            sym_type = parts[1] # The Type (T, t, etc)
            sym_name = parts[2] # The Function Name

            # 4. Convert String Address to Ghidra Address Object
            # toAddr() is a Ghidra FlatAPI helper. 
            # It handles hex strings automatically.
            try:
                # We assume the address is hex. toAddr handles "400d..." fine.
                target_addr = toAddr(addr_str)
            except:
                print("Error converting address: " + addr_str)
                continue

            # 5. Create the Label in Ghidra
            # createLabel(Address addr, String name, boolean makePrimary, SourceType source)
            try:
                # remove any existing label there to clean up
                # (Optional, but good if they re-run the script)
                createLabel(target_addr, sym_name, True, SourceType.IMPORTED)
                count += 1
            except Exception as e:
                print("Could not apply label " + sym_name + ": " + str(e))

    print("Success! Loaded " + str(count) + " symbols.")

# Run the script
run()


