# Pre-Day Setup Guide — Stockholm Airbnb dbt Project

Please complete all steps **before the session** so you can focus on learning dbt during the class, not troubleshooting setup.

## Step 1: Install dbt and the BigQuery adapter

```bash
pip install dbt-core dbt-bigquery
```

Verify installation:
```bash
dbt --version
```

You should see output like: `dbt version X.Y.Z` and `BigQuery adapter version X.Y.Z`.

---

## Step 2: Set up a Google Cloud Project

If you don't already have a Google Cloud project:

1. Go to [Google Cloud Console](https://console.cloud.google.com)
2. Click the project selector at the top and create a new project
3. Name it something like `airbnb-dbt-training`
4. Wait for the project to be created (takes a few seconds)

**Enable the BigQuery API:**
1. In the Cloud Console, search for "BigQuery API"
2. Click "Enable" on the BigQuery API page
3. Wait for it to be enabled (takes a few seconds)

**Find your Project ID:**
- In the Cloud Console top bar, you'll see your project name and **Project ID** (a unique identifier). Copy the Project ID — you'll need it in Step 4.

---

## Step 3: Clone or navigate to the repository

If you haven't already cloned the repository:

```bash
git clone <repository-url>
cd dbt-airbnb
```

---

## Step 4: Configure your dbt credentials

dbt needs a file at `~/.dbt/profiles.yml` to connect to BigQuery.

1. **Copy the template:**
   ```bash
   cp profiles.yml ~/.dbt/profiles.yml
   ```

2. **Edit the file to add your credentials:**
   ```bash
   # Open in your editor
   nano ~/.dbt/profiles.yml
   # or
   code ~/.dbt/profiles.yml
   ```

3. **Fill in your details** — the file should look like this (replace `your-gcp-project` and `dbt_yourname_airbnb` with your actual values):

   ```yaml
   stockholm_airbnb:
     target: dev
     outputs:
       dev:
         type: bigquery
         method: oauth
         project: your-gcp-project          # e.g., airbnb-dbt-training
         dataset: dbt_yourname_airbnb       # e.g., dbt_anna_airbnb
         threads: 4
         timeout_seconds: 300
         location: EU
   ```

   - **project**: Your Google Cloud Project ID (from Step 2)
   - **dataset**: The BigQuery dataset where dbt will create tables. Use a unique name like `dbt_yourname_airbnb` (no spaces, lowercase)

4. **Save the file** (Ctrl+S / Cmd+S in most editors)

---

## Step 5: Verify your setup with `dbt debug`

In the repository directory, run:

```bash
dbt debug
```

**If everything is working**, you should see:
- ✓ All green checkmarks ✓
- Message: "All checks passed!"

**If you see errors:**

| Error | Solution |
|---|---|
| "Profile target not found" | Check that `profiles.yml` is at `~/.dbt/profiles.yml` (not in the repo directory) |
| "project" or "dataset" is missing | Edit `~/.dbt/profiles.yml` and fill in both fields (no empty values) |
| "Authentication failed" / "Access denied" | Run `gcloud auth application-default login` to authenticate with Google Cloud |
| "BigQuery API not enabled" | Go back to Step 2 and enable the BigQuery API in the Cloud Console |

---

## Step 6: Create your BigQuery dataset

Before we seed data, create the dataset in BigQuery:

```bash
bq mk --dataset --location=EU dbt_yourname_airbnb
```

(Replace `dbt_yourname_airbnb` with your dataset name from Step 4.)

If it says "Dataset already exists", that's fine.

---

## Step 7: Verify everything one more time

Run `dbt debug` again — if all checks pass, you're ready for the session.

```bash
dbt debug
```

You should see:
```
All checks passed!
```

---

## Troubleshooting: Common Errors

### "gcloud: command not found"
You need the Google Cloud CLI. Install it from [here](https://cloud.google.com/sdk/docs/install).

### "dbt: command not found"
You installed dbt but it's not in your PATH. Try:
```bash
python -m pip install --upgrade dbt-core dbt-bigquery
```

Then restart your terminal.

### "Profile 'stockholm_airbnb' not found"
The profile name in `dbt_project.yml` must match the name in `~/.dbt/profiles.yml`. Both should be `stockholm_airbnb`.

### "Authentication failed" after running `dbt debug`
Run:
```bash
gcloud auth application-default login
```

This will open a browser window asking you to log in with your Google account. Log in and grant permission.

---

## You're Ready!

Once you see "All checks passed!" from `dbt debug`, you're all set. See you at the session!

If you run into issues not covered here, ping the instructor before the session day.
