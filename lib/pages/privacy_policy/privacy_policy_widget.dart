import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'privacy_policy_model.dart';
export 'privacy_policy_model.dart';

class PrivacyPolicyWidget extends StatefulWidget {
  const PrivacyPolicyWidget({super.key});

  static String routeName = 'PrivacyPolicy';
  static String routePath = '/privacy-policy';

  @override
  State<PrivacyPolicyWidget> createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget> {
  late PrivacyPolicyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPolicyModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF162F6A),
          automaticallyImplyLeading: true,
          title: Text(
            'سياسة الخصوصية',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
              font: GoogleFonts.changa(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Header
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF162F6A),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 20.0),
                    child: Column(
                      children: [
                        Text(
                          'North Africa TV',
                          style: FlutterFlowTheme.of(context).headlineMedium.override(
                            font: GoogleFonts.changa(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                            ),
                            color: Colors.white,
                          ),
                        ),
                        Divider(
                          color: Colors.white.withOpacity(0.3),
                          thickness: 1.0,
                        ),

                        SizedBox(height: 8.0),
                        Text(
                          'تاريخ التحديث: 19 أغسطس 2025',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.changa(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Content
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Introduction
                      Text(
                        'تولي شركة  Nafrica TV Ltd أهمية كبيرة لخصوصيتك وأمان معلوماتك الشخصية توضّح هذه الصفحة كيفية جمع، استخدام وحماية بيانات المستخدمين عند استخدام التطبيق بما يتوافق مع متطلبات  Google Play  و Apple App Store',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.changa(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,

                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 24.0),
                      
                      // Section 1
                      _buildSection(
                        '1-  المعلومات  التي نقوم بجمعها',
                        [
                          'المعلومات الشخصية: البريد الإلكتروني عند  التواصل  معنا',
                          'بيانات الجهاز والاستخدام: نوع الجهاز، نظام التشغيل، سجل التصفح، والإعدادات لتحسين الأداء',
                          'بيانات الموقع الجغرافي: عند تفعيل خدمة الموقع لتخصيص المحتوى',
                          'ملاحظة: لا نجمع البيانات الحساسة  (مثل البيانات المالية أو الصحية)',
                        ],
                      ),
                      
                      SizedBox(height: 24.0),
                      
                      // Section 2
                      _buildSection(
                        '2-  استخدام المعلومات للأغراض التالية',
                        [
                          'تقديم وتحسين خدمات التطبيق والمحتوى المقدم',
                          'التواصل مع المستخدمين بشأن التحديثات',
                          'حماية أمن التطبيق وضمان تشغيله بشكل سليم',
                          'تحليل استخدام التطبيق لتحسين تجربة المستخدم',
                        ],
                      ),
                      
                      SizedBox(height: 24.0),
                      
                      // Section 3
                      _buildSection(
                        '3-  مشاركة المعلومات للأغراض التالية:',
                        [
                          'الامتثال للقوانين واللوائح المعمول بها',
                          'حماية حقوقنا وممتلكاتنا وسلامة مستخدمينا',
                          'مع مزودي خدمات موثوقين يساعدوننا في تشغيل  التطبيق أو تقديم المحتوى، مع الالتزام بالحفاظ على سرية المعلومات',
                        ],
                      ),
                      
                      SizedBox(height: 24.0),
                      
                      // Section 4
                      _buildSection(
                        '4-  الإعلانات وبيانات الطرف الثالث',
                        [
                          'قد يحتوي الموقع أو التطبيق على إعلانات من طرف ثالث',
                          'بعض مقدمي الإعلانات قد يستخدمون بيانات غير شخصية لتقديم محتوى مخصص',
                          'يمكنك تعطيل الإعلانات المستهدفة من إعدادات جهازك',
                        ],
                      ),
                      
                      SizedBox(height: 24.0),
                      
                      // Section 5
                      _buildSection(
                        '5- حماية المعلومات',
                        [
                          'نستخدم تدابير أمنية تقنية وإدارية لحماية بياناتك من الوصول أو الاستخدام أو الكشف غير المصرح  به',
                        ],
                      ),
                      
                      SizedBox(height: 24.0),
                      
                      // Section 6
                      _buildSection(
                        '6-  تحديثات سياسة الخصوصية',
                        [
                          'قد نقوم بتحديث هذه السياسة من وقت لآخر',
                          'سيتم نشر أي تغييرات على هذه الصفحة مع ذكر تاريخ التحديث',
                        ],
                      ),
                      
                      SizedBox(height: 24.0),
                      
                      // Terms of Use Section
                      Text(
                        'شروط الاستخدام',
                        style: FlutterFlowTheme.of(context).titleMedium.override(
                          font: GoogleFonts.changa(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                          color: Color(0xFF162F6A),
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 24.0),
                      
                      // Terms Section 1
                      _buildSection(
                        '1-  القبول بالشروط',
                        [
                          'باستخدامك للتطبيق، فإنك توافق على الالتزام بهذه الشروط. إذا كنت لا توافق، يرجى عدم استخدام التطبيق.',
                        ],
                      ),
                      
                      SizedBox(height: 24.0),
                      
                      // Terms Section 2
                      _buildSection(
                        '2-  المحتوى وحقوق الملكية',
                        [
                          'جميع المحتويات داخل  التطبيق محمية بموجب حقوق الملكية الفكرية',
                          'يُمنع نسخ أو توزيع المحتوى دون إذن كتابي مسبق',
                        ],
                      ),
                      
                      SizedBox(height: 24.0),
                      
                      // Terms Section 3
                      _buildSection(
                        '3-  المسؤولية',
                        [
                          'التطبيق متاح كما  هو  ولا نتحمل أي مسؤولية عن الأضرار الناتجة عن استخدامه',
                        ],
                      ),
                      
                      SizedBox(height: 24.0),
                      
                      // Terms Section 4
                      _buildSection(
                        '4-  التعديلات',
                        [
                          'نحتفظ بالحق في تعديل هذه الشروط في أي وقت',
                          'سيتم إعلام المستخدمين بأي تغييرات ونشر النسخة الجديدة على الموقع',
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FlutterFlowTheme.of(context).titleMedium.override(
            font: GoogleFonts.changa(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
            color: Color(0xFFC8AB6B),
          ),
          textAlign: TextAlign.right,
        ),
        SizedBox(height: 12.0),
        ...points.map((point) => Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 0.0),
                width: 6.0,
                height: 6.0,
                decoration: BoxDecoration(
                  color: Color(0xFFC8AB6B),
                  shape: BoxShape.circle,
                ),
              ),
              Expanded(
                child: Text(
                  point,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.changa(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,

                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        )).toList(),
      ],
    );
  }
} 