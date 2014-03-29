#include <iostream>
#include <string>
#include <cmath>

void FourBitConvertToBinary(int value, int *array);

void Display_Final(int i_sign, int i_no_mantissa_bits, int *i_mantissa_bits, int i_no_exponent_bits, int *i_exponent_bits);

void RightNormalise(int *i_arr_int_mantissa, int *i_arr_frac_mantissa, int *i_arr_mantissa, int mantissa_bits, int *i_exponent);

void LeftNormalise(int *i_arr_frac_mantissa, int *i_arr_mantissa, int mantissa_bits, int *i_exponent);

int BCDConvertToInteger(int value, int *array);

void ConvertToBinary(int value, int *array, int no_of_bits);

void DoubleBCD(int *bcd_array, int no_bcd_digits, int *carry_out);

//void MultiplyMantissaByTen(int *mant, int mant_bits);

void AddBtoA(int *mant, int mant_bits, int *b_mant);

void ReconstructShift(int *reco_array_int, int *reco_array_frac, int *orig_mantissa, int shift_bits, int mantissa_bits);

void FracFloatToBCD(int mantissa_bits, int *mantissa_fraction, int *reco_fraction_bcd, int fraction_digits);

void AddAtoBBCD(int *bcd_arrayA, int *bcd_arrayB, int no_bcd_digits);

void ShiftAdd3IntToBCD(int mantissa_no_bits, int bcd_no_digits, int *mantissa_integer, int *bcd_array);

void ShiftAdd3BCDToInt(int mantissa_no_bits, int bcd_no_digits, int *mantissa_integer, int *bcd_array);

using namespace std;

int main()
{

	int i;
	int j;

	string str_sf_num;

	int i_digits_accuracy = 6;
	int i_digits_counter = 0;

	// Define the integer variables 
	int i_integer_digits = 6;
	int arr1D_i_integer[i_integer_digits];
	int arr2D_i_BCD_integer_digit[i_integer_digits][4];
	int i_integer_digit_counter = 0;
	
	// Define the fractional variables
	// This is five because we always need a leading zero
	int i_fraction_digits = 5;
	int arr1D_i_fraction[i_fraction_digits];
	int arr1D_i_fraction_copy[i_fraction_digits];
	int arr2D_i_BCD_fraction_digit[i_fraction_digits][4];
	int i_fraction_digit_counter = 0;

	// Assume that 0=+ve, 1=-ve
	int i_mantissa_sign = 0;
//	int i_exponent_sign = 0;

	// Is an extracted value a digit ~(0-9)?
	bool b_ascii_a_number = false;	
	// Set if we get to the dp
	bool b_dp_flag = false;

	// Is input invalid?
	bool b_invalid_input = false;

	int i_sf_num_len = 0;
	int i_ascii = 0;
	int i_value = 0;

	// Ensure all 2D array digits are set to zero
	for (i = 0; i<i_integer_digits; i++)
	{
		for (j = 0; j<4; j++)
		{
			arr2D_i_BCD_integer_digit[i][j] = 0;
		}
		arr1D_i_integer[i] = 0;
	} 

	for (i = 0; i<i_fraction_digits; i++)
	{
		for (j = 0; j<4; j++)
		{
			arr2D_i_BCD_fraction_digit[i][j] = 0;
		}
		arr1D_i_fraction[i] = 0;
		arr1D_i_fraction_copy[i] = arr1D_i_fraction[i];
	} 

	// Start Program
	cout << endl;
	cout << "Floating Point Conversion" << endl;
	cout << "*************************" << endl << endl;		
	cout << "Enter a number in the format (sign)dd...d(decimal_point)dd...d:" << endl;
	cout << "Note that no sign symbol is interpretted as a positive." << endl;
	cout << "NOTE: Calculator has a maximum accuracy of " << (i_digits_accuracy) << " digits" << endl;
	cout << "This includes the leading zero." << endl;
	cout << "For numbers < 1.0 the normalisation process WILL result in rounding errors and/or loss of accuracy." << endl << endl;
	cin >> str_sf_num;
	cout << "Echo: " << str_sf_num << endl << endl;

	// How long is this string?
	i_sf_num_len = str_sf_num.length();
	cout << "String Length: " << i_sf_num_len << endl << endl;

	// Loop through the string and extract the various numbers
	// and assign to variables.
	b_ascii_a_number = false;
	i_integer_digit_counter = 0;
	i_fraction_digit_counter = 0;

	for (i = 0; i<i_sf_num_len; i++)
	{
		//Get the character	
		i_ascii = str_sf_num[i];

		//Is it a -sign value?	
		if (i_ascii	== 45)
		{
				i_mantissa_sign = 1;
		}

		// If it is a dp then set flag
		if (i_ascii	== 46)
		{
			b_dp_flag = true;
			b_ascii_a_number = false;
		}

		//Is ascii a number?
		if ((i_ascii	> 47) && (i_ascii < 58))
		{
			b_ascii_a_number = true;
			i_value = i_ascii-48;

			if ((b_dp_flag == false) && (i_digits_counter < i_digits_accuracy))
			{
				for (j = 0; j<(i_integer_digits-1); j++)
				{
					arr1D_i_integer[j] = arr1D_i_integer[j+1];
					//cout << j;
				}
				arr1D_i_integer[i_integer_digits-1]=i_value;
				i_integer_digit_counter++;
				i_digits_counter++;
			}
			else if ((b_dp_flag == true) && (i_digits_counter < i_digits_accuracy))
			{
				arr1D_i_fraction[i_fraction_digit_counter]=i_value;
				arr1D_i_fraction_copy[i_fraction_digit_counter] = arr1D_i_fraction[i_fraction_digit_counter];
				i_fraction_digit_counter++;
				i_digits_counter++;
			}
			else
			{
				b_invalid_input == true;
			}
		}
	}

	if (b_invalid_input == false)
	{
		// Now echo back what the parser has put together.
		cout << "The parser has interpretted the input as:" << endl;
		if (i_mantissa_sign == 1)
		{
			cout << "-";
		}

		bool b_leading_zero = true;
		int	 i_temp2 = 0;
	
		for (i = 0; i<i_integer_digits; i++)
		{
			i_temp2 = arr1D_i_integer[i];
			if (i_temp2 >0)
			{
				b_leading_zero = false;
			}
			if (b_leading_zero == false || i==(i_integer_digits-1))
			{
				cout << arr1D_i_integer[i];
			}
		}

		cout << ".";
	
		for (i = 0; i<i_fraction_digits; i++)
		{
			cout << arr1D_i_fraction[i];
		}
		
		cout << endl << endl;
	
		// *******************************************
		//
		//
		// *******************************************
		// Conversion To Floating Point
		// *******************************************
		//
		//
		//
		// *******************************************


		// Changing this can break things!!
		int i_mantissa_bits = 23;
	
		int arr1D_i_mantissa_int_reg[i_mantissa_bits];
		int arr1D_i_mantissa_int_reg2[i_mantissa_bits];
		int arr1D_i_mantissa_frac_reg[i_mantissa_bits];
		int arr1D_i_mantissa_reg[i_mantissa_bits];
	
		int i_exponent_bits = 8;
	
		int arr1D_i_exponent_reg[i_exponent_bits];

		// Use an array as this can be passed to functions.
		int i_exponent_value = 0;
		int i_arr1D_exponent_value[1];
	
		// 0=+ve 1=-ve
		int i_sign_reg = 0;
	
		int arr1D_i_BCD_digit[4];
	
		bool b_zero_flag = true;
		bool b_integer_gt_zero = false;
		bool b_fraction_gt_zero = false;

		int arr1D_i_carry_out[1];

		int i_int_checksum;
		int i_frac_checksum;
	
		// Ensure that all bits are set to zero
		for (i = 0; i<i_mantissa_bits; i++)
		{
			arr1D_i_mantissa_int_reg[i] = 0;
			arr1D_i_mantissa_int_reg2[i] = 0;
			arr1D_i_mantissa_frac_reg[i] = 0;
			arr1D_i_mantissa_reg[i] = 0;
		}
	
		for (i = 0; i<i_exponent_bits; i++)
		{
			arr1D_i_exponent_reg[i] = 0;
		}

		i_arr1D_exponent_value[0] = 0;
		i_exponent_value = 0;	

		arr1D_i_carry_out[0] = 0;

		i_sign_reg = i_mantissa_sign;
	
// 		// This is one method. Easy to detect overflow using this method.
// 		// Need to Convert String of BCD into integer Mantissa 
// 		for (i=0; i<i_integer_digits; i++)
// 		{
// 			// Multiply current integer number by 10
// 			MultiplyMantissaByTen(arr1D_i_mantissa_int_reg, i_mantissa_bits);
// 
// 			// Four Bit convert to binary
// 			FourBitConvertToBinary(arr1D_i_integer[i], arr1D_i_BCD_digit);
// 
// 			// Place this in temp integer mantissa
// 			arr1D_i_mantissa_int_reg2[3] = arr1D_i_BCD_digit[3];
// 			arr1D_i_mantissa_int_reg2[2] = arr1D_i_BCD_digit[2];
// 			arr1D_i_mantissa_int_reg2[1] = arr1D_i_BCD_digit[1];
// 			arr1D_i_mantissa_int_reg2[0] = arr1D_i_BCD_digit[0];
// 
// 			// Add this to integer 
// 			AddBtoA(arr1D_i_mantissa_int_reg, i_mantissa_bits, arr1D_i_mantissa_int_reg2);
// 		}
	
		ShiftAdd3BCDToInt(i_mantissa_bits, i_integer_digits, arr1D_i_mantissa_int_reg, arr1D_i_integer);
	
		// We now hold onto this until we have calculated fractional part of binary value
		for (i = i_mantissa_bits-1; i>=0; i--)
		{
			// Call double_mantissa
			DoubleBCD(arr1D_i_fraction_copy, i_fraction_digits, arr1D_i_carry_out);
			arr1D_i_mantissa_frac_reg[i] = arr1D_i_carry_out[0];
		}

		//Output Fraction Mantissa
		j=1;
		cout << "Integer  Mantissa: ";
		for (i = i_mantissa_bits-1; i>=0; i--)	
		{
			if (j==4)
			{
				cout << " ";
				j=0;
			}

			cout << arr1D_i_mantissa_int_reg[i];
			j++;
		}
	
		cout << endl;

		//Output Fraction Mantissa
		j=1;
		cout << "Fraction Mantissa: ";
		for (i = i_mantissa_bits-1; i>=0; i--)	
		{
			if (j==4)
			{
				cout << " ";
				j=0;
			}
			cout << arr1D_i_mantissa_frac_reg[i];
			j++;
		}

		cout << endl << endl;

		// Check for Zero
		// (In VHDL this would be done by comparing the value of the register with zero)
		// Check for zero integer
		i_int_checksum = 0;
		for (i=0; i<i_integer_digits; i++)
		{
			i_int_checksum = arr1D_i_integer[i]+i_int_checksum;
		}

		if (i_int_checksum > 0)
		{
			b_integer_gt_zero = true;
			b_zero_flag = false;
			// Set exponent to default value
			// This needs changing for something that is compatible with register manipulation
			i_arr1D_exponent_value[0] = 127;
		}
	
		i_frac_checksum = 0;
		for (i=0; i<i_fraction_digits; i++)
		{
			i_frac_checksum = arr1D_i_fraction[i]+i_frac_checksum;
		}

		if (i_frac_checksum > 0)
		{
			b_fraction_gt_zero = true;
			b_zero_flag = false;
			// Set exponent to default value
			// This needs changing for something that is compatible with register manipulation
			i_arr1D_exponent_value[0] = 127;
		}
		// If not zero then we need to normalise
		// Copy Fractional Part into final register
		// If Integer > 0 then right shift until last 1 reamins in integer mantissa

		// If Integer = 0 then left shift until first 1 is shifted out of mantissa
		// Note this shouldn't happen if input is in standard form
		if(b_zero_flag == false)
		{
			if(b_integer_gt_zero == true)
			{
				//Call routine that right normalises the mantissa
				// Note that this normalises the register...
				RightNormalise(arr1D_i_mantissa_int_reg, arr1D_i_mantissa_frac_reg, arr1D_i_mantissa_reg, i_mantissa_bits, i_arr1D_exponent_value);
			}
			else if (b_fraction_gt_zero == true)
			{
				//Call routine that right normalises the mantissa
				// Note that this normalises the register...
				LeftNormalise(arr1D_i_mantissa_frac_reg, arr1D_i_mantissa_reg, i_mantissa_bits, i_arr1D_exponent_value);
			}
		}	
		
	 i_exponent_value = i_arr1D_exponent_value[0];
	 // Convert the exponent to a binary value
	 ConvertToBinary(i_exponent_value, arr1D_i_exponent_reg, 8);

		// Display Output
		Display_Final(i_sign_reg, i_mantissa_bits, arr1D_i_mantissa_reg, i_exponent_bits, arr1D_i_exponent_reg);

		// *******************************************
		//
		//
		// *******************************************
		// Conversion Back to Decimal
		// *******************************************
		//
		//
		//
		// *******************************************

		//char temp;
		//cout << "Press and character and ENTER to start the Conversion Back to Decimal..." << endl;
		//cin >> temp;

		cout << "and converting back...." << endl;

		int i_calc_exponent_value = 0;
		int i_calc_mantissa_shifts = 0;
	
		int arr1D_i_reconstructed_int[i_mantissa_bits];
		int arr1D_i_reconstructed_frac[i_mantissa_bits];
	
		int arr1D_i_reconstructed_int_BCD[i_integer_digits];
		int arr1D_i_reconstructed_frac_BCD[i_fraction_digits];

		// Reset all bits in array
		for (i=0; i< i_mantissa_bits; i++)
		{
			arr1D_i_reconstructed_int[i] = 0;
			arr1D_i_reconstructed_frac[i] = 0;
		}
	
		for (i=0; i< i_integer_digits; i++)
		{
			arr1D_i_reconstructed_int_BCD[i] = 0;
		}
	
		for (i=0; i< i_fraction_digits; i++)
		{
			arr1D_i_reconstructed_frac_BCD[i] = 0;
		}
	
		// Get Exponent Value
		for (i=0; i< i_exponent_bits; i++)
		{
			i_calc_exponent_value = i_calc_exponent_value + arr1D_i_exponent_reg[i]*(0.5+pow(2.0,(double)(i)));
		}
	
		cout << endl << "Exponent Value: " << i_calc_exponent_value << endl;
	
		// Calculate Whether Mantissa needs left or right shifting
		i_calc_mantissa_shifts = i_calc_exponent_value-127;
		cout << "Required Mantissa Shifts: " << i_calc_mantissa_shifts << endl;

		// zero?
		if (i_calc_mantissa_shifts == 127)
		{
			//Leave both reconstructed arrays set to zero
		}
		else
		{
			// Call routine that reconstructs shift.	
			ReconstructShift(arr1D_i_reconstructed_int, arr1D_i_reconstructed_frac, arr1D_i_mantissa_reg, i_calc_mantissa_shifts, i_mantissa_bits);		
		}
	
		// Display Registers
		//Output Fraction Mantissa
		j=1;
		cout << endl << "Reconstructed Integer Mantissa: ";
		for (i = i_mantissa_bits-1; i>=0; i--)	
		{
			if (j==4)
			{
				cout << " ";
				j=0;
			}
	
			cout << arr1D_i_reconstructed_int[i];
			j++;
		}
	
		cout << endl;
	
		//Output Fraction Mantissa
		j=1;
		cout << "Reconstructed Fraction Mantissa: ";
		for (i = i_mantissa_bits-1; i>=0; i--)	
		{
			if (j==4)
			{
				cout << " ";
				j=0;
			}
			cout << arr1D_i_reconstructed_frac[i];
			j++;
		}
	
		cout << endl << endl;

		// Output
		// Calculate Integer Value
		// Use Shift Add-3 Algorithm
		// THIS DESTROYS VALUE OF arr1D_i_reconstructed_int
		ShiftAdd3IntToBCD(i_mantissa_bits, i_integer_digits, arr1D_i_reconstructed_int, arr1D_i_reconstructed_int_BCD);

		// Calculate Fractional Value
		// This requires a look up table.
		FracFloatToBCD(i_mantissa_bits, arr1D_i_reconstructed_frac, arr1D_i_reconstructed_frac_BCD, i_fraction_digits);

		cout << "The Reconstructed Input from the FP32 value is: " << endl;
		if (i_mantissa_sign == 1)
		{
			cout << "-";
		}

		b_leading_zero = true;
		i_temp2 = 0;
	
		for (i = 0; i<i_integer_digits; i++)
		{
			i_temp2 = arr1D_i_reconstructed_int_BCD[i];
			if (i_temp2 >0)
			{
				b_leading_zero = false;
			}
			if (b_leading_zero == false || i==(i_integer_digits-1))
			{
				cout << arr1D_i_reconstructed_int_BCD[i];
			}
		}

		cout << ".";
	
		for (i = 0; i<i_fraction_digits; i++)
		{
			cout << arr1D_i_reconstructed_frac_BCD[i];
		}
		
		cout << endl << endl;


		cout << "Complete!" << endl;
	}
	else if (b_invalid_input == true)
	{	
		cout << "Input is not valid" << endl << endl;
	}

	return 0;
}

// *******************************************
//
//
//
// *******************************************
//         FUNCTIONS START HERE
// *******************************************
//
//
//
// *******************************************

void ShiftAdd3BCDToInt(int mantissa_no_bits, int bcd_no_digits, int *mantissa_integer, int *bcd_array) 
{
	int i;
	int j;

	int k;

	int temp_array[4];
	int temp_value = 0;
	
	int bcd_bits = (bcd_no_digits*4);

	int bit_bcd_array[bcd_bits];

	// Reset all binary integer bits to zero
	for (i=0; i<mantissa_no_bits; i++)
	{
		mantissa_integer[i] = 0;
	}

	// Care needs to be taken
	// BCD digits are labelled 0,1,2,3,4...
	// binary digits are reverse of this
	
	// Convert Integer to Binary and assign to bit_bcd_array
	for (k=0; k<bcd_no_digits; k++)
	{
		// Convert integer to an array of BCD bits
		FourBitConvertToBinary(bcd_array[bcd_no_digits-1-k], temp_array);

		// Copy BCD back to array
		bit_bcd_array[(k*4)+0] = temp_array[0];
		bit_bcd_array[(k*4)+1] = temp_array[1];
		bit_bcd_array[(k*4)+2] = temp_array[2];
		bit_bcd_array[(k*4)+3] = temp_array[3];

	}

//  // Display Copy
// 	for (k=0; k<bcd_bits; k++)
// 	{
// 		cout << bit_bcd_array[bcd_bits-1-k];
// 	}
// 
// 	cout << endl << endl;

	for (k=0; k<mantissa_no_bits; k++)
	{
		//Right shift binary bits
		for (i=0; i<mantissa_no_bits-1; i++)
		{
			mantissa_integer[i] = mantissa_integer[i+1];
		}

		mantissa_integer[mantissa_no_bits-1] = bit_bcd_array[0];

		//Right shift bcd bits
		for (i=0; i<bcd_bits-1; i++)
		{
			bit_bcd_array[i] = bit_bcd_array[i+1];
		}

		bit_bcd_array[bcd_bits-1] = 0;

// 		// Display shift
// 		for (j=0; j<bcd_bits; j++)
// 		{
// 			cout << bit_bcd_array[bcd_bits-1-j];
// 		}
// 
// 		cout << endl << endl;

				// Now we need to take each BCD digit and calculate its value
		for (j=0; j<bcd_no_digits; j++)
		{
			// Get BCD digit
			temp_array[0] = bit_bcd_array[(j*4)+0];
			temp_array[1] = bit_bcd_array[(j*4)+1];
			temp_array[2] = bit_bcd_array[(j*4)+2];
			temp_array[3] = bit_bcd_array[(j*4)+3];

			// Convert this to an integer
			temp_value = BCDConvertToInteger(temp_value, temp_array);

			//cout << " Temp Value: " << temp_value << " ";

			// Is this integer greater than 5, if so add 3
			// Don't add 3 if last shift!
			if ((temp_value >=8) && (j<(mantissa_no_bits-1)))
			{
				temp_value = temp_value-3;
			}

			// Convert integer to BCD
			FourBitConvertToBinary(temp_value, temp_array);

			// Copy BCD back to array
			bit_bcd_array[(j*4)+0] = temp_array[0];
			bit_bcd_array[(j*4)+1] = temp_array[1];
			bit_bcd_array[(j*4)+2] = temp_array[2];
			bit_bcd_array[(j*4)+3] = temp_array[3];

		}

	}

	return;

}

void ShiftAdd3IntToBCD(int mantissa_no_bits, int bcd_no_digits, int *mantissa_integer, int *bcd_array) 
{
	int i;
	int j;

	int k;

	int temp_array[4];
	int temp_value = 0;
	
	int bcd_bits = (bcd_no_digits*4);

	int bit_bcd_array[bcd_bits];

	// Reset all bits to zero
	for (i=0; i<bcd_bits; i++)
	{
		bit_bcd_array[i] = 0;
	}

	for (i=0; i<mantissa_no_bits; i++)
	{
	
		// Shift BCD array left
		for (j=(bcd_bits)-1; j>0; j--)
		{
				bit_bcd_array[j] = bit_bcd_array[j-1];
				//cout << bit_bcd_array[j];
		}
		//Shift digit into BCD array
		bit_bcd_array[0] = mantissa_integer[mantissa_no_bits-1];
		//cout << bit_bcd_array[0] << " ";

		// Shift Integer Array Left
		for (j=mantissa_no_bits-1; j>0; j--)
		{
				mantissa_integer[j] = mantissa_integer[j-1];
		}
	
		mantissa_integer[0]=0;

		// Now we need to take each BCD digit and calculate its value
		for (k=0; k<bcd_no_digits; k++)
		{
			// Get BCD digit
			temp_array[0] = bit_bcd_array[(k*4)+0];
			temp_array[1] = bit_bcd_array[(k*4)+1];
			temp_array[2] = bit_bcd_array[(k*4)+2];
			temp_array[3] = bit_bcd_array[(k*4)+3];

			// Convert this to an integer
			temp_value = BCDConvertToInteger(temp_value, temp_array);

			//cout << " Temp Value: " << temp_value << " ";

			// Is this integer greater than 5, if so add 3
			// Don't add 3 if last shift!
			if ((temp_value >=5) && (i<(mantissa_no_bits-1)))
			{
				temp_value = temp_value+3;
			}

			// Convert integer to BCD
			FourBitConvertToBinary(temp_value, temp_array);

			// Copy BCD back to array
			bit_bcd_array[(k*4)+0] = temp_array[0];
			bit_bcd_array[(k*4)+1] = temp_array[1];
			bit_bcd_array[(k*4)+2] = temp_array[2];
			bit_bcd_array[(k*4)+3] = temp_array[3];

		}

		//cout << endl;
	}

	// Now convert to a sequence of integers	
	for (k=0; k<bcd_no_digits; k++)
	{
		// Get BCD digit
		temp_array[0] = bit_bcd_array[(k*4)+0];
		temp_array[1] = bit_bcd_array[(k*4)+1];
		temp_array[2] = bit_bcd_array[(k*4)+2];
		temp_array[3] = bit_bcd_array[(k*4)+3];

		// Convert this to an integer
		temp_value = BCDConvertToInteger(temp_value, temp_array);
		//cout << k << " " << temp_value << "  ";
		bcd_array[bcd_no_digits-1-k] = temp_value;
	}

	return;

}

void FracFloatToBCD(int mantissa_bits, int *mantissa_fraction, int *reco_fraction_bcd, int fraction_digits)
{

	int arr1D_frac_root[mantissa_bits];
	int arr1D_frac_BCD[mantissa_bits];
	int i;

	int i_ascii;
	int i_value;

	int j;

	int arr1D_i_carry_out[1];

	//Store 2^(-23) as one long string of BCD digits
	string str_root_num = "00000011920928955078125";

	for (i=0;i<mantissa_bits;i++)
	{
		arr1D_frac_root[i]=0;
		arr1D_frac_BCD[i]=0;
	}
	
	for (i=0;i<mantissa_bits;i++)
	{
		i_ascii = str_root_num[i];

		//Is ascii a number?
		if ((i_ascii	> 47) && (i_ascii < 58))
		{
		
			i_value = i_ascii-48;
			arr1D_frac_root[i] = i_value;
		}
	}

	// Track doubling of BCD values
	for (j=0; j<mantissa_bits;j++)
	{
// 		if ((mantissa_bits-j)>9)
// 		{
// 			cout << "2^(-" <<mantissa_bits-j << ") ";
// 		}
// 		else
// 		{
// 		cout << "2^(-0" << mantissa_bits-j << ") ";
// 		}
// 		for (i=0;i<mantissa_bits;i++)
// 		{
// 			cout << arr1D_frac_root[i];
// 		}

// 		cout << endl;

		if (mantissa_fraction[j] == 1)
		{
			AddAtoBBCD(arr1D_frac_BCD, arr1D_frac_root, mantissa_bits);
		}

		DoubleBCD(arr1D_frac_root, mantissa_bits, arr1D_i_carry_out);

		
	}
	

	cout << endl;

// 	for (i=0;i<mantissa_bits;i++)
// 	{
// 		cout << arr1D_frac_BCD[i];
// 	}
// 
// 	cout << endl;

	for (i=0;i<fraction_digits;i++)
	{
		reco_fraction_bcd[i] = arr1D_frac_BCD[i];
	}

  return;

//void DoubleBCD(int *bcd_array, int no_bcd_digits, int *carry_out)
}

void ReconstructShift(int *reco_array_int, int *reco_array_frac, int *orig_mantissa, int shift_bits, int mantissa_bits)
{
	int i;
	int j;
	
	// Bit zero of the integer must be 1 by definition
	reco_array_int[0] = 1;

	// Copy Original Mantissa into reconstructed Mantissa
	for (i=0; i<mantissa_bits; i++)
	{
		reco_array_frac[i] = orig_mantissa[i];
	}

	// Now shift by required amount
	// Left Shift
	if (shift_bits > 0)
	{
		for (i=0;i<shift_bits;i++)
		{
			for (j=(mantissa_bits-1); j>0; j--)
			{
				reco_array_int[j]=reco_array_int[j-1];
				//cout << reco_array_int[j] << " ";
			}

			reco_array_int[0]=reco_array_frac[mantissa_bits-1];
			//cout << reco_array_int[0] << endl;

			for (j=(mantissa_bits-1); j>0; j--)
			{
				reco_array_frac[j]=reco_array_frac[j-1];
			}
			reco_array_frac[0]=0;
		}
	}
	//Right Shift
	else if (shift_bits < 0)
	{
		for (i=0;i>shift_bits;i--)
		{
			for (j=1; j<mantissa_bits; j++)
			{
				reco_array_frac[j-1]=reco_array_frac[j];
			}

			reco_array_frac[mantissa_bits-1]=reco_array_int[0];

			for (j=1; j<mantissa_bits; j++)
			{
				reco_array_int[j-1]=reco_array_int[j];
			}
		}
	}

	return;
}

void RightNormalise(int *i_arr_int_mantissa, int *i_arr_frac_mantissa, int *i_arr_mantissa, int mantissa_bits, int *i_exponent)
{
	int i;
	int j;
	int k;
	int m;
	int carry;
	int i_offset;

	// It has occurred to me that this is easier to implement as a left shift....
	// Combine the two registers into one long register
	// Left shift this long register until the first 1 drops out on LHS
	// the first n bits represent the mantissa.

	// Assign these bits to the register
	int i_double_length = 2*mantissa_bits;
	int arr1D_i_reg_long[i_double_length];

	for (i=0; i<mantissa_bits; i++)
	{
		arr1D_i_reg_long[i] = i_arr_frac_mantissa[i];
		arr1D_i_reg_long[i+mantissa_bits] = i_arr_int_mantissa[i];
	}

// 	// Output this register
// 	i=2;	
// 	for (j=i_double_length-1; j>=0; j--)
// 	{
// 		if (i==4)
// 		{
// 			cout << " ";
// 			i=0;
// 		}
// 		cout << arr1D_i_reg_long[j];
// 		i++;
// 	}	
// 	cout << endl;

	i_offset = 0;
	// Left Shift the register until you see a '1' appear in the carry.
	for (j=0; j<i_double_length; j++)
	{
		int carry=arr1D_i_reg_long[i_double_length-1];

		for (i=i_double_length-1; i>0; i--)
		{
			arr1D_i_reg_long[i]=arr1D_i_reg_long[i-1];
		}
		arr1D_i_reg_long[0]=0;

		if (carry == 1) 
		{
			i_offset = j;
			break;
		}
 }

// 		// Output this register
// 	k=2;	
// 	for (m=i_double_length-1; m>=0; m--)
// 	{
// 		if (k==4)
// 		{
// 			cout << " ";
// 			k=0;
// 		}
// 		cout << arr1D_i_reg_long[m];
// 		k++;
// 	}	
// 	cout << endl;
// 		
// 	}

	// Map the result onto mantissa
	for (i=0; i<mantissa_bits; i++)
	{
		i_arr_mantissa[i] = arr1D_i_reg_long[i+mantissa_bits];
	}

	// Because we are left shifting instead of right shifting the exponent calculation
	// needs an adjustment
	i_exponent[0] = i_exponent[0]+(mantissa_bits-1-i_offset);
	//cout << "i_offset: " << i_offset << " i_exponent_0: " << i_exponent[0] << endl;

	return;
}

void LeftNormalise(int *i_arr_frac_mantissa, int *i_arr_mantissa, int mantissa_bits, int *i_exponent)
{
	
	int i;
	int j;
	int i_offset;

	int arr1D_i_reg_temp[mantissa_bits];

	for (j=0; j<mantissa_bits; j++)
	{
		arr1D_i_reg_temp[j]=i_arr_frac_mantissa[j];
	}

	i_offset = 0;
	// Left Shift the register until you see a '1' appear in the carry.
	for (j=0; j<mantissa_bits; j++)
	{
		int carry=arr1D_i_reg_temp[mantissa_bits-1];

		for (i=mantissa_bits-1; i>0; i--)
		{
			arr1D_i_reg_temp[i]=arr1D_i_reg_temp[i-1];
		}
		arr1D_i_reg_temp[0]=0;

		if (carry == 1) 
		{
			i_offset = j+1;
			break;
		}
 }

// 		// Output this register
// 	k=2;	
// 	for (m=i_double_length-1; m>=0; m--)
// 	{
// 		if (k==4)
// 		{
// 			cout << " ";
// 			k=0;
// 		}
// 		cout << arr1D_i_reg_long[m];
// 		k++;
// 	}	
// 	cout << endl;
// 		
// 	}

	// Map the result onto mantissa
	for (i=0; i<mantissa_bits; i++)
	{
		i_arr_mantissa[i] = arr1D_i_reg_temp[i];
	}

	
	i_exponent[0] = i_exponent[0]-i_offset;
	//cout << "i_offset: " << i_offset << " i_exponent_0: " << i_exponent[0] << endl;


	return;
}

void Display_Final(int i_sign, int i_no_mantissa_bits, int *i_mantissa_bits, int i_no_exponent_bits, int *i_exponent_bits)
{

	int i;
	int j;

	// MSB to LSB

	cout << "The Conversion Process has Yielded:" << endl << endl;

	cout << "Sign: " << i_sign << endl;

	cout << "Mantissa: ";

	j=1;
	for (i = 0; i<i_no_mantissa_bits; i++)	
	{
		if (j==4)
		{
			cout << " ";
			j=0;
		}
		cout << i_mantissa_bits[i_no_mantissa_bits-i-1];
		j++;
	}

	cout << endl << "Exponent: ";

	j=0;
	for (i = 0; i<i_no_exponent_bits; i++)	
	{
		if (j==4)
		{
			cout << " ";
			j=0;
		}
		cout << i_exponent_bits[i_no_exponent_bits-i-1];
		j++;
	}


	cout << endl << endl;
	
	return;
}

int BCDConvertToInteger(int value, int *array)
{

	// This is a bit of a cheat but as we can cast between binary and the 
	// equivalent of integers in VHDL
	// (i.e. this code wouldn't be necessary anyway)
	// I guess this is ok 

	value = array[0]*1 + array[1]*2 + array[2]*4 + array[3]*8;

	//cout << " " << array[3] << array[2] <<array[1] << array[0] << " ";
	//cout << "Value: " << value << " ";

	return value;

}


void FourBitConvertToBinary(int value, int *array)
{
	array[3] = 0;
	array[2] = 0;
	array[1] = 0;
	array[0] = 0;
	
	if (value == 0)
	{
		array[3] = 0;
		array[2] = 0;
		array[1] = 0;
		array[0] = 0;
	}
	
	else if (value == 1)
	{
		array[3] = 0;
		array[2] = 0;
		array[1] = 0;
		array[0] = 1;
	}

	else if (value == 2)
	{
		array[3] = 0;
		array[2] = 0;
		array[1] = 1;
		array[0] = 0;
	}

	else if (value == 3)
	{
		array[3] = 0;
		array[2] = 0;
		array[1] = 1;
		array[0] = 1;
	}

	else if (value == 4)
	{
		array[3] = 0;
		array[2] = 1;
		array[1] = 0;
		array[0] = 0;
	}

	else if (value == 5)
	{
		array[3] = 0;
		array[2] = 1;
		array[1] = 0;
		array[0] = 1;
	}

	else if (value == 6)
	{
		array[3] = 0;
		array[2] = 1;
		array[1] = 1;
		array[0] = 0;
	}

	else if (value == 7)
	{
		array[3] = 0;
		array[2] = 1;
		array[1] = 1;
		array[0] = 1;
	}

	else if (value == 8)
	{
		array[3] = 1;
		array[2] = 0;
		array[1] = 0;
		array[0] = 0;
	}

	else if (value == 9)
	{
		array[3] = 1;
		array[2] = 0;
		array[1] = 0;
		array[0] = 1;
	}

	else if (value == 10)
	{
		array[3] = 1;
		array[2] = 0;
		array[1] = 1;
		array[0] = 0;
	}

	else if (value == 11)
	{
		array[3] = 1;
		array[2] = 0;
		array[1] = 1;
		array[0] = 1;
	}

	else if (value == 12)
	{
		array[3] = 1;
		array[2] = 1;
		array[1] = 0;
		array[0] = 0;
	}

	else if (value == 13)
	{
		array[3] = 1;
		array[2] = 1;
		array[1] = 0;
		array[0] = 1;
	}

	else if (value == 14)
	{
		array[3] = 1;
		array[2] = 1;
		array[1] = 1;
		array[0] = 0;
	}

	else if (value == 15)
	{
		array[3] = 1;
		array[2] = 1;
		array[1] = 1;
		array[0] = 1;
	}

	else 
	{
		array[3] = 0;
		array[2] = 0;
		array[1] = 0;
		array[0] = 0;
	}


	return;
}

void ConvertToBinary(int value, int *array, int no_of_bits)
{

	int i;
	int temp;

  for(i = (no_of_bits-1); i>-1; i--)
  {
		// Can use the pow function here as we will not need to do a conversion in VHDL
		// it is implicit.	
		temp = pow(2.0,double(i));

		//cout << (i) << " Value: " << value << " Temp: " << temp << endl;

		if (temp <= value)
		{
			value = value-temp;
			array[i] = 1;
		}
		else
		{
			array[i] = 0;
		}
  }

	return;
}

void AddAtoBBCD(int *bcd_arrayA, int *bcd_arrayB, int no_bcd_digits)
{

	int i;
	int carry;
	
	carry=0;
	for(i = (no_bcd_digits-1); i>=0; i--)
	{
		// We can treat the BCD digits as integers as we can do similar in VHDL

		// Note however that msb is in i=0 and lsb is in i=(no_bcd_digits-1)
		bcd_arrayA[i] = bcd_arrayA[i]+bcd_arrayB[i]+carry;

		//cout << i << " " << bcd_array[i] << endl;

		if (bcd_arrayA[i] > 9)
		{
			bcd_arrayA[i] = bcd_arrayA[i]-10;
			carry=1;
		}
		else
		{
			carry=0;
		}
	}
	
	return;
}

void DoubleBCD(int *bcd_array, int no_bcd_digits, int *carry_out)
{

	int i;
	int carry;
	
	carry=0;
	for(i = (no_bcd_digits-1); i>=0; i--)
	{
		// We can treat the BCD digits as integers as we can do similar in VHDL

		// Note however that msb is in i=0 and lsb is in i=(no_bcd_digits-1)
		bcd_array[i] = bcd_array[i]+bcd_array[i]+carry;

		//cout << i << " " << bcd_array[i] << endl;

		if (bcd_array[i] > 9)
		{
			bcd_array[i] = bcd_array[i]-10;
			carry=1;
		}
		else
		{
			carry=0;
		}
	}
	
	carry_out[0] = carry;
	//cout << "Returned Carry: " << carry_out[0] << endl << endl;

	return;
}


// void MultiplyMantissaByTen(int *mant, int mant_bits)
// {		
// 	int i;
// 	int i_carry;
// 		
// 	int arr1D_i_temp[mant_bits];
// 
// 	for (i = mant_bits-2; i>=0; i=i-1)
// 	{
// 		// b_mant holds double the value
// 		arr1D_i_temp[i+1] = mant[i];
// 		mant[i+1] = mant[i];
// 	}
// 	
// 	//Ensure arr1D_i_temp[0] and mant[0] is set to zero	
// 	arr1D_i_temp[0]=0;
// 	mant[0]=0;
// 	
// 	// Now Double Again (x4)	
// 	for (i = mant_bits-2; i>=0; i=i-1)
// 	{
// 		mant[i+1] = mant[i];
// 	}
// 	
// 	// Now Double Again (x8)	
// 	for (i = mant_bits-2; i>=0; i=i-1)
// 	{
// 		mant[i+1] = mant[i];
// 	}
// 
// 	
// 	// Now Add b_mant to mant  (x10)	
// 	AddBtoA(mant, mant_bits, arr1D_i_temp);
// 				
// 	return;
// }

void AddBtoA(int *mant, int mant_bits, int *b_mant)
{
	int i;
	int i_carry;
	
	// Now Add b_mant to mant
	i_carry = 0;
	for (i = 0; i<mant_bits; i++)
	{
		// 0
		if ((mant[i] == 0) && (b_mant[i] == 0) && (i_carry == 0))
		{
			//cout << "0";
			mant[i]=0;
			i_carry=0;		
		}
	
		// 1
		else if ((mant[i] == 0) && (b_mant[i] == 0) && (i_carry == 1))
		{
			//cout << "1";
			mant[i]=1;
			i_carry=0;		
		}
		
		// 2
		else if ((mant[i] == 0) && (b_mant[i] == 1) && (i_carry == 0))
		{
		  //cout << "2";
			mant[i]=1;
			i_carry=0;		
		}
		
		// 3
		else if ((mant[i] == 0) && (b_mant[i] == 1) && (i_carry == 1))
		{
			//cout << "3";
			mant[i]=0;
			i_carry=1;		
		}

		// 4
		else if ((mant[i] == 1) && (b_mant[i] == 0) && (i_carry == 0))
		{
			//cout << "4";
			mant[i]=1;
			i_carry=0;		
		}
		
		// 5
		else if ((mant[i] == 1) && (b_mant[i] == 0) && (i_carry == 1))
		{
			//cout << "5";
			mant[i]=0;
			i_carry=1;		
		}
		
		// 6
		else if ((mant[i] == 1) && (b_mant[i] == 1) && (i_carry == 0))
		{
			//cout << "6";
			mant[i]=0;
			i_carry=1;		
		}
		
		// 7
		else if ((mant[i] == 1) && (b_mant[i] == 1) && (i_carry == 1))
		{
			//cout << "7";
			mant[i]=1;
			i_carry=1;		
		}
			
	}
		
	return;
}