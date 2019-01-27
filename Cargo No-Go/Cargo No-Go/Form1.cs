using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace Cargo_No_Go
{
    public partial class Cargo_No_Go : Form
    {
        public Cargo_No_Go()
        {
            InitializeComponent();
        }

        private List<string> id = new List<string>();

        private void start_button_Click(object sender, EventArgs e)
        {
            if (start_button.Text.Contains("Start"))
            {
                Stolen_Timer.Start();
                start_button.Text = "Stop Security Systems";
                addButton.Enabled = false;
                removeButton.Enabled = false;
            }
            else
            {
                Stolen_Timer.Stop();
                start_button.Text = "Start Security Systems";
                addButton.Enabled = true;
                removeButton.Enabled = true;
            }
        }
        
        private void Stolen_Timer_Tick(object sender, EventArgs e)
        {
            string[] dataFile = File.ReadAllLines(@"C:\Users\priya\Desktop\Cargo Theft Data Set\DemoData.csv");
            List<string> dataList = dataFile.ToList<string>();
            List<string> truckList = new List<string>();

            foreach (string line in dataList)
            {
                string[] linearr = line.Split(',');
                truckList.Add(linearr[2]);
            }
            
            List<int> lastOccurrenceList = new List<int>();

            foreach(string truck in id)
                lastOccurrenceList.Add(truckList.LastIndexOf(truck));

            for (int i = 0; i < lastOccurrenceList.Count; i++)
            {
                DateTime dateTime = DateTime.Parse(dataList[lastOccurrenceList[i]].Split(',').ElementAt(8));

                if (Math.Abs(float.Parse(dataList[lastOccurrenceList[i]].Split(',').ElementAt(9)) - float.Parse(dataList[lastOccurrenceList[i]].Split(',').ElementAt(16))) > 0.009)
                    MessageBox.Show($"Truck with device serial number {id[i]} has been stolen!", "Theft Reported", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                else if(Math.Abs(float.Parse(dataList[lastOccurrenceList[i]].Split(',').ElementAt(10)) - float.Parse(dataList[lastOccurrenceList[i]].Split(',').ElementAt(17))) > 0.009)
                    MessageBox.Show($"Truck with device serial number {id[i]} has been stolen!", "Theft Reported", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                else if (DateTime.Now.Ticks - dateTime.Ticks > 36010000000)
                    MessageBox.Show($"Truck with device serial number {id[i]} has had its GPS sensor destroyed or is undergoing maintenance.", "Suspected Theft", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                //else if(off route)
                //{
                    //stolen
                //}
            }
        }

        private void addButton_Click(object sender, EventArgs e)
        {
            if (int.TryParse(IDTextBox.Text, out int ID))
            {
                truckIDListBox.Items.Add(IDTextBox.Text);
                id.Add(IDTextBox.Text);
            }
            else MessageBox.Show("That is not a valid device serial number.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            IDTextBox.Text = "";
        }

        private void removeButton_Click(object sender, EventArgs e)
        {
            if (truckIDListBox.SelectedItem != null)
            {
                truckIDListBox.Items.Remove(truckIDListBox.SelectedItem);
                id.Remove(truckIDListBox.SelectedItem.ToString());
            }
            else MessageBox.Show("Select the device you wish to stop tracking.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }
    }
}
