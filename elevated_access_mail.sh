#!/bin/bash
#Function to send remainder mail to users when revocation and current date is same
function Revoke_today
{
grep $x $Script_Dir/Elevated_Access_Dump.txt | sort | uniq > $Script_Dir/Elevated_Access.txt;
(
        echo "From: FROM_ADDRESS"
        echo "To: FROM_ADDRESS"
        echo "Cc: MAIL_ADDRESS"
        echo "MIME-Version: 1.0"
        echo "Content-Type: multipart/alternative; "
        echo ' boundary="PAA08673.1018277622/servername"'
        echo "Subject: Elevated Access Validity"
        echo ""
        echo "This is a MIME-encapsulated message"
        echo ""
        echo "--PAA08673.1018277622/servername"
        echo "Content-Type: text/html"
        echo ""
        echo "<html>
                <head>
                <style>
                p {font-family:Palatino Linotype;font-size: 15px;}
                table, td, th {border: 2px solid black;font-family:Palatino Linotype;text-align:center;padding: 5px 10px 5px 10px;font-size: 15px;}
                th {background-color:#003D7C;}
                table.fixed { table-layout:fixed; }
                table.fixed td { overflow: hidden; }
                table{border-collapse: collapse;border-spacing: 1px;}
                </style>
                </head>
                <body>
                <p> Hi Application Owner, </p>
                <p>The elevated privilege of the following Local account(s) will be revoked today at 12pm. In case of extension, kindly write back to MAIL_ADDRESS on the extension period and the reason for extension. </p>
                <table class="fixed">
                <tr>
                        <th>ServerName</th>
                        <th>User</th>
                        <th>Department</th>
                        <th>Project</th>
                        <th>Date</th>
                </tr>";
                while IFS= read -r line
                do
                        ServerName=`echo $line | grep "$x" | awk -F ',' '{print $2}'`;
                        Department=`echo $line | grep "$x" | awk -F ',' '{print $4}'`;
                        Users=`echo $line | grep "$x" | awk -F ',' '{print $3}' | tr '-' ','`;
                        Project=`echo $line | grep "$x" | awk -F ',' '{print $5}'`;
                        validDate=`echo $line | grep "$x" | awk -F ',' '{print $1}'`;
                echo "<tr>
                        <td>$ServerName</td>
                        <td>$Users</td>
                        <td>$Department</td>
                        <td>$Project</td>
                        <td>$validDate</td>
                </tr>";
                done < $Script_Dir/Elevated_Access.txt;
                echo "</table>
                <p><i> Note : This is an auto generated email </i></p>
                </body></html>"
                echo "--PAA08673.1018277622/servername"
) | /sbin/sendmail -t;
#rm -rf $Script_Dir/Elevated_Access.txt
}

#Function to send remainder mail to users before 3, 7 or 10 days
function Revoke_Remainders
{
grep $x $Script_Dir/Elevated_Access_Dump.txt | sort | uniq > $Script_Dir/Elevated_Access.txt;
(
        echo "From: MAIL_ADDRESS"
        echo "To: MAIL_ADDRESS"
        echo "Cc: MAIL_ADDRESS"
        echo "MIME-Version: 1.0"
        echo "Content-Type: multipart/alternative; "
        echo ' boundary="PAA08673.1018277622/servername"'
        echo "Subject: Elevated Access Validity"
        echo ""
        echo ""
        echo "--PAA08673.1018277622/servername"
        echo "Content-Type: text/html"
        echo ""
        echo "<html>
                <head>
                <style>
                p {font-family:Palatino Linotype;font-size: 15px;}
                table, td, th {border: 2px solid black;font-family:Palatino Linotype;text-align:center;padding: 5px 10px 5px 10px;font-size: 15px;}
                th {background-color:#003D7C;}
                table.fixed { table-layout:fixed; }
                table.fixed td { overflow: hidden; }
                table{border-collapse: collapse;border-spacing: 1px;}
                </style>
                </head>
                <body>
                <p> Hi Application Owner, </p>
                <p>The elevated privilege of the following Local account(s) will be revoked on the mentioned date(s). In case of extension, kindly write back to MAIL_ADDRESS on the extension period and the reason for extension. </p>
                <table class="fixed">
                <tr>
                        <th>ServerName</th>
                        <th>User</th>
                        <th>Department</th>
                        <th>Project</th>
                        <th>Date</th>
                </tr>";
                while IFS= read -r line
                do
                        ServerName=`echo $line | grep "$x" | awk -F ',' '{print $2}'`;
                        Department=`echo $line | grep "$x" | awk -F ',' '{print $4}'`;
                        Users=`echo $line | grep "$x" | awk -F ',' '{print $3}' | tr '-' ','`;
                        Project=`echo $line | grep "$x" | awk -F ',' '{print $5}'`;
                        validDate=`echo $line | grep "$x" | awk -F ',' '{print $1}';`;
                echo "<tr>
                        <td>$ServerName</td>
                        <td>$Users</td>
                        <td>$Department</td>
                        <td>$Project</td>
                        <td>$validDate</td>
                </tr>";
                done < $Script_Dir/Elevated_Access.txt;
        echo "</table>
                <p><i> Note : This is an auto generated email </i></p>
                </body></html>"
                echo "--PAA08673.1018277622/servername"
) | /sbin/sendmail -t;
#rm -rf $Script_Dir/Elevated_Access.txt
}
#Function to send remainder mail to Team when revocation date exceeds current date
function Revoke_Remainders_Team
{
grep $x $Script_Dir/Elevated_Access_Dump.txt | sort | uniq > $Script_Dir/Elevated_Access.txt;
(
        echo "From: MAIL_ADDRESS"
        echo "To: MAIL_ADDRESS"
        echo "Cc: MAIL_ADDRESS"
        echo "MIME-Version: 1.0"
        echo "Content-Type: multipart/alternative; "
        echo ' boundary="PAA08673.1018277622/servername"'
        echo "Subject: Elevated Access Validity"
        echo ""
        echo "This is a MIME-encapsulated message"
        echo ""
        echo "--PAA08673.1018277622/servername"
        echo "Content-Type: text/html"
        echo ""
        echo "<html>
                <head>
                <style>
                p {font-family:Palatino Linotype;font-size: 15px;}
                table, td, th {border: 2px solid black;font-family:Palatino Linotype;text-align:center;padding: 5px 10px 5px 10px;font-size: 15px;}
                th {background-color:#003D7C;}
                table.fixed { table-layout:fixed; }
                table.fixed td { overflow: hidden; }
                table{border-collapse: collapse;border-spacing: 1px;}
                </style>
                </head>
                <body>
                <p> Hi Team, </p>
                <p>Kindly check on the revocation date(s) of the following Local account(s). </p>
                <table class="fixed">
                <tr>
                        <th>ServerName</th>
                        <th>User</th>
                        <th>Department</th>
                        <th>Project</th>
                        <th>Date</th>
                </tr>";
                while IFS= read -r line
                do
                        ServerName=`echo $line | grep "$x" | awk -F ',' '{print $2}'`;
                        Department=`echo $line | grep "$x" | awk -F ',' '{print $4}'`;
                        Users=`echo $line | grep "$x" | awk -F ',' '{print $3}' | tr '-' ','`;
                        Project=`echo $line | grep "$x" | awk -F ',' '{print $5}'`;
                        validDate=`echo $line | grep "$x" | awk -F ',' '{print $1}';`;
                echo "<tr>
                        <td>$ServerName</td>
                        <td>$Users</td>
                        <td>$Department</td>
                        <td>$Project</td>
                        <td>$validDate</td>
                </tr>";
                done < $Script_Dir/Elevated_Access.txt;
        echo "</table>
                <p><i> Note : This is an auto generated email </i></p>
                </body></html>"
        echo "--PAA08673.1018277622/servername"
) | /sbin/sendmail -t;
#rm -rf $Script_Dir/Elevated_Access.txt
}
function main()
{
Script_Dir="/home/admsa1/Final";
Current_date=`date "+%s"`;
#mysql query to dump Elevated access and server owner details
#mysql -u username -pXXXXXX --execute "SELECT unx_elv_acs_validity.validity AS Validity, unx_elv_acs_validity.servername AS ServerName, unx_elv_acs.users AS Users, unx_srv_inventory.server_application As Department, unx_srv_inventory.server_remarks As Project, unx_srv_inventory.server_primary_contact_email AS PrimaryContact, unx_srv_inventory.server_secondary_email AS SecondaryContact from nusportal.unx_elv_acs_validity inner join nusportal.unx_elv_acs on unx_elv_acs_validity.servername=unx_elv_acs.servername inner join nusportal.unx_srv_inventory on unx_srv_inventory.server_name=unx_elv_acs.servername where unx_srv_inventory.server_name NOT LIKE 'itacdta';" | sed 's/\t/,/g' | uniq > $Script_Dir/Elevated_Access_Dump.txt
#Store Primary and Secondary Contact in Array
for i in $(cut -f 6,7 -d ',' $Script_Dir/Elevated_Access_Dump.txt | grep -v PrimaryContact| sort| uniq)
do
        Local_array[$N]=`echo $i`;
        #echo ${Local_array[$N]};
        #echo Local_array[$N];
        N=`expr $N + 1`;
done
for x in "${Local_array[@]}"
do
        if [ `grep $x $Script_Dir/Elevated_Access_Dump.txt | cut -f 1 -d ',' | sort | uniq | wc -l` -eq 1 ] #Send mail single entry of application owner
        then
        {
                Valid_till_days=`grep $x $Script_Dir/Elevated_Access_Dump.txt | cut -f 1 -d ','| uniq`;
                Valid_till_secs=$(date -d "$Valid_till_days" +"+%s");
                diff=$(($Valid_till_secs-$Current_date));
                days=$(($diff/(60*60*24)));
                echo $days;
                if [[ ( $days -eq 3 || $days  -eq 7 ||  $days  -eq 10) ]] #Send remainder before 3rd, 7th and 10th day
                then
                {
                        Revoke_Remainders;
                }
                elif [[ ($days -lt 0) ]] #Send mail to Team to check on revocation date
                then
                {       Revoke_Remainders_Team;
                }
                elif [[ ($days -eq 0) ]] #Send mail for revocation on the current day
                then
                {
                        Revoke_today;
                }
                fi
        }
        elif [ `grep $x $Script_Dir/Elevated_Access_Dump.txt | cut -f 1 -d ',' | sort | uniq | wc -l` -gt 1 ] #Accounts with multiple dates or accounts
        then
        {
                for a in $(grep $x $Script_Dir/Elevated_Access_Dump.txt | cut -f 1 -d ',' | sort | uniq) #Store multiple dates in array
                do
                        Array_date[$N]=`echo $a`;
                        echo ${Array_date[$N]};
                        echo Array_date[$N];
                        N=`expr $N + 1`;
                done
                for b in "${Array_date[@]}"
                do
                        present_date_sec=`date "+%s"`;
                        Revoke_date=`echo $b`;
                        Revoke_seconds=$(date -d $Revoke_date "+%s");
                        Seconds_diff=$(($Revoke_seconds-$present_date_sec));
                        value=$(($Seconds_diff/(86400)));
                        if [ $value -lt 0 ] #Send mail to Team when anyone of entries has revocation dates less than current date
                        then
                        {
                                Revoke_Remainders_Team;
                                break;
                        }
                        elif [[ ( $value -eq 0 || $value -eq 3 || $value -eq 7 ||  $value  -eq 10) ]] #Sendmail to users for remainder
                        then
                        {
                                Revoke_Remainders;
                                break;
                        }
                        fi
                done

        }
        fi
done
#rm -rf $Script_Dir/Elevated_Access_Dump.txt;
}
main
