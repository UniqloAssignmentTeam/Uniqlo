﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Uniqlo
{
    public class Crypto
    {
        public static string HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));

                // Convert byte array to a string
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        public static bool VerifyPassword(string savedPasswordHash, string password)
        {
            // Compute the hash of the password using the same algorithm as HashPassword
            string hashedPassword = HashPassword(password);

            // Compare the computed hash with the saved password hash
            return savedPasswordHash.Equals(hashedPassword);
        }
    }
}