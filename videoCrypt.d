/*
    This software allows you to encrypt a video by converting it into another video after creating a mask which alters all the bits of the file's binary with XOR.
    You start with an origin video to be encrypted, then you get a destiny video which is what the origin video will be transformed into, but to transform the
    origin video into the destiny video you need to know how to change the bits of the binary of the file, that is what the mask is for, the mask will be a binary
    which when combined with the origin video by XOR operations will generate the destiny video, and you can undo the operation at any time.
*/

// import the tools we need
import std.file : read, write;
import std.stdio : readln, writeln;

// start the program
void main()
{
    // create these arrays of memory in order to read the video files and then build the mask and the result
    ubyte[] origin, destiny, mask, result;
    // these strings will contain the names of the files and the answer of the user
    string nameOrigin, nameDestiny, nameMask, answer;

    // ask the user what they want
    writeln("Type 1 if you wanna encrypt a video and 2 if you wanna decrypt a video: ");
    // read what the user typed and remove the '\n' in the end
    answer = readln()[0 .. $ - 1];

    // if the user wants to encrypt a video
    if (answer == "1")
    {
        // tell the user what to type
        writeln("Type the name of the plain text video: ");
        // read what the user typed and remove the '\n' in the end
        nameOrigin = readln()[0 .. $ - 1];
        // tell the user what to type
        writeln("Type the name of the cipher text video: ");
        // read what the user typed and remove the '\n' in the end
        nameDestiny = readln()[0 .. $ - 1];
        // read the files as memory
        origin = cast(ubyte[]) read(nameOrigin), destiny = cast(ubyte[]) read(nameDestiny);

        // start a loop to check all bytes of the origin file
        foreach (i, bytePiece; origin)
            // do an XOR between the byte of the origin and the corresponding byte of the destiny file, then append it to 'mask'
            mask ~= bytePiece ^ destiny[i];

        // create the file with the binary of 'mask' as a video file
        write("mask.mp4", mask);
        // let the user know it is done making the mask
        writeln("Finished the mask.");
    }
    // if the user wants to decrypt a video
    else if (answer == "2")
    {
        // tell the user what to type
        writeln("Type the name of the cipher text video: ");
        // read what the user typed and remove the '\n' in the end
        nameOrigin = readln()[0 .. $ - 1];
        // tell the user what to type
        writeln("Type the name of the decryption mask: ");
        // read what the user typed and remove the '\n' in the end
        nameMask = readln()[0 .. $ - 1];
        // read the files as memory
        origin = cast(ubyte[]) read(nameOrigin), mask = cast(ubyte[]) read(nameMask);

        // start a loop to check all bytes from the binary of 'mask'
        foreach (i, bytePiece; mask)
            // do an XOR between the byte of the mask and the corresponding byte of the origin file, then append to 'result'
            result ~= bytePiece ^ origin[i];

        // create the file with the binary of 'result' as a video file
        write("result.mp4", result);
        // let the user know you've finished it
        writeln("Finished the result.");
    }
    // if the user typed something wrong
    else
        // tell the user it was invalid
        writeln("Invalid command.");
}
