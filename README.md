# 🏥 Azure-Based Patient Record Analytics

This project demonstrates a complete **cloud-native pipeline** for analyzing synthetic Electronic Health Record (EHR) data using **Azure Data Lake Storage Gen2**, **Azure Synapse Analytics (Serverless SQL)**, and **Power BI**.

---

## 📌 **Project Objective**

Build an end-to-end solution to:
- Securely **store** patient data in a scalable data lake.
- **Query** and analyze data directly using Synapse Serverless SQL Pools — no dedicated infrastructure needed.
- **Visualize** key insights using Power BI (optional).

---

## ⚙️ **Architecture**

| Layer | Azure Service | Purpose |
|-------|-----------------|---------|
| **Data Storage** | Azure Data Lake Storage Gen2 | Store raw EHR CSV files securely |
| **Query Engine** | Azure Synapse Analytics (Serverless SQL) | Query data on-demand directly from the data lake |
| **Visualization** | Power BI (optional) | Create interactive dashboards and reports |

---

## 📁 **Data Schema**

The project uses four synthetic EHR datasets:

| File | Description |
|------|--------------|
| `patients.csv` | Patient demographic and diagnosis details |
| `visits.csv` | Records of patient visits |
| `lab_results.csv` | Laboratory test results |
| `medications.csv` | Medication prescriptions and treatment periods |

All files are uploaded to a **Data Lake Storage container** named `ehr-data`.

---

## 🚀 **Step-by-Step Workflow**

### 1️⃣ **Set Up Storage**

- Provision an **Azure Storage Account** with **Hierarchical Namespace** enabled (Data Lake Storage Gen2).
- Create a **container** `ehr-data`.
- Upload all CSV files.

---

### 2️⃣ **Create Synapse Workspace**

- Create an **Azure Synapse Workspace**.
- Link your Storage Account as the default Data Lake.
- Note your **Serverless SQL endpoint**:
